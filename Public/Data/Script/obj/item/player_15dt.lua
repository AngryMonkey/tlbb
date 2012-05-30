-- 任务1.5倍经验药水
-- 消耗一个药水，为人物提供一个小时1.5倍经验时间

--脚本号
x300045_g_scriptId = 300045
x300045_g_ItemId = 30008016
x300045_g_BuffId = 62

x300045_g_BuffPalyer_25 = 60
x300045_g_BuffAll_15 = 62
x300045_g_BuffPet_25 = 61
x300045_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300045_OnDefaultEvent( sceneId, selfId, nItemIndex )
	
	-- 如果身上有自己，不能吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300045_g_BuffAll_15) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"你已经使用了多倍经验药物，请在效果消失后再使用。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 如果身上有2.5的，就不让吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300045_g_BuffPalyer_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"您身上已经存在了更高效率的多倍经验时间！")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
		
	-- 如果玩家有 双倍经验时间 不让使用
	local nCurHaveTime = DEGetMoneyTime(sceneId, selfId)
	if nCurHaveTime > 0  and  DEIsLock(sceneId, selfId)~=1  then
		BeginEvent(sceneId)
			AddText(sceneId,"您身上已经存在了更高效率的多倍经验时间！")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	x300045_UseItem( sceneId, selfId, nItemIndex)
	
end

function x300045_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300045_EatMe( sceneId, selfId, nItemIndex)
	x300045_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300045_UseItem( sceneId, selfId, nItemIndex)
	-- 先检测这个 nItemIndex 的物品是不是和当前的对应，
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300045_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  背包内部错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 扣一个药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300045_g_BuffId, 100 )
		BeginEvent(sceneId)
			AddText(sceneId,"您增加了一个小时的人物1.5经验时间。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

