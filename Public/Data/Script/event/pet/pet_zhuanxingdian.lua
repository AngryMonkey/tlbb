-- 转性丹

-- 脚本号
x800108_g_ScriptId = 800108;

x800108_zhuanXingdian_ItemDataID = 30502003;	--转性丹

--**********************************
-- 任务入口函数
--**********************************
function x800108_OnDefaultEvent(sceneId, selfId, targetId)
	--珍兽洗点
	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, targetId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 800108);
end

--**********************************
-- 列举事件
--**********************************
function x800108_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800108_g_ScriptId, "改变珍兽性格" , 6, -1);
end

--**********************************
-- 转性丹规则
-- 0 - 胆小
-- 1 - 谨慎	
-- 2 - 忠诚
-- 3 - 精明
-- 4 - 勇猛
--**********************************
function x800108_ZhuanXingdian(sceneId, selfId, petGUID_H, petGUID_L)

	if not sceneId or not selfId or not petGUID_H or not petGUID_L then
		x800108_ShowTips(sceneId, selfId, "错误操作。");
		return 0;
	end
	
	local zhuanXingdianItemName = GetItemName(sceneId, x800108_zhuanXingdian_ItemDataID);
	if not zhuanXingdianItemName then
		x800108_ShowTips(sceneId, selfId, "未开放物品。");
		return 0;
	end

	local curAIType = LuaFnGetPetAITypeByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not curAIType or curAIType == -1 then
		x800108_ShowTips(sceneId, selfId, "你指定的珍兽不存在。");
		return 0;
	end

	local petAvailableFlag = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petGUID_H, petGUID_L);
	if not petAvailableFlag or petAvailableFlag ~= 1 then
		x800108_ShowTips(sceneId, selfId, "不能对锁定的珍兽进行操作。");
		return 0;
	end
	
	local availableItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x800108_zhuanXingdian_ItemDataID);
	if not availableItemCount or availableItemCount < 1 then
		x800108_ShowTips(sceneId, selfId, "需要"..zhuanXingdianItemName.."。");
		return 0;
	end
	
	local delRet = LuaFnDelAvailableItem(sceneId, selfId, x800108_zhuanXingdian_ItemDataID, 1);
	if not delRet or delRet ~= 1 then
		x800108_ShowTips(sceneId, selfId, "扣除"..zhuanXingdianItemName.."失败。");
		return 0;
	end

	--AI类型必改变，而且每种机率是一样的
	local toAIType = random(4) - 1;
	if toAIType >= curAIType then
		toAIType = toAIType + 1;
	end

	local ret = LuaFnSetPetAITypeByGUID(sceneId, selfId, petGUID_H, petGUID_L, toAIType);
	if not ret or ret ~= 1 then
		x800108_ShowTips(sceneId, selfId, "你指定的珍兽不存在。");
		return 0;
	end

	x800108_ShowTips(sceneId, selfId, "您的珍兽的性格已经改变成功。");
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	return 1;
end

--**********************************
-- 提示信息
--**********************************
function x800108_ShowTips(sceneId, selfId, tipMsg)
	BeginEvent(sceneId);
		AddText(sceneId, tipMsg);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end
