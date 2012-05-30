--珍兽蛋

--脚本号
x300028_g_scriptId = 300028

--type
--0	= 普通规则
--1 = 普通RMB规则
--2 = 炫耀RMB规则

x300028_g_petItems = {};
x300028_g_petItems[30309100] = {dataId=3009, type=1}	--还童丹：兔子
x300028_g_petItems[30309101] = {dataId=3019, type=1}	--还童丹：燕子
x300028_g_petItems[30309102] = {dataId=3029, type=1}	--还童丹：乌龟
x300028_g_petItems[30309103] = {dataId=3039, type=1}	--还童丹：狗
x300028_g_petItems[30309104] = {dataId=3049, type=1}	--还童丹：刺猬
x300028_g_petItems[30309105] = {dataId=3059, type=1}	--还童丹：猴子
x300028_g_petItems[30309106] = {dataId=3069, type=1}	--还童丹：松鼠
x300028_g_petItems[30309107] = {dataId=3079, type=1}	--还童丹：浣熊
x300028_g_petItems[30309108] = {dataId=3089, type=1}	--还童丹：鹦鹉
x300028_g_petItems[30309109] = {dataId=3099, type=1}	--还童丹：蜥蜴
x300028_g_petItems[30309110] = {dataId=3109, type=1}	--还童丹：蝙蝠
x300028_g_petItems[30309111] = {dataId=3119, type=1}	--还童丹：大螳螂
x300028_g_petItems[30309112] = {dataId=3129, type=1}	--还童丹：鳄鱼
x300028_g_petItems[30309113] = {dataId=3139, type=1}	--还童丹：猫头鹰
x300028_g_petItems[30309114] = {dataId=3149, type=1}	--还童丹：獾
x300028_g_petItems[30309115] = {dataId=3159, type=1}	--还童丹：老虎
x300028_g_petItems[30309116] = {dataId=3169, type=1}	--还童丹：野猪
x300028_g_petItems[30309117] = {dataId=3179, type=1}	--还童丹：冰蚕
x300028_g_petItems[30309118] = {dataId=3189, type=1}	--还童丹：鹰
x300028_g_petItems[30309119] = {dataId=3199, type=1}	--还童丹：鸵鸟
x300028_g_petItems[30309120] = {dataId=3209, type=1}	--还童丹：豹子
x300028_g_petItems[30309121] = {dataId=3219, type=1}	--还童丹：北极熊
x300028_g_petItems[30309122] = {dataId=3229, type=1}	--还童丹：孔雀
x300028_g_petItems[30309123] = {dataId=3239, type=1}	--还童丹：剑齿虎
x300028_g_petItems[30309124] = {dataId=3249, type=1}	--还童丹：大猩猩
x300028_g_petItems[30309125] = {dataId=3259, type=1}	--还童丹：犀牛
x300028_g_petItems[30309126] = {dataId=3269, type=1}	--还童丹：雪貂
x300028_g_petItems[30309127] = {dataId=3279, type=1}	--还童丹：剑龙
x300028_g_petItems[30309128] = {dataId=3289, type=1}	--还童丹：驳马
x300028_g_petItems[30309129] = {dataId=3299, type=1}	--还童丹：黄鸟
x300028_g_petItems[30309130] = {dataId=3309, type=1}	--还童丹：年兽
x300028_g_petItems[30309131] = {dataId=3319, type=1}	--还童丹：龙龟
x300028_g_petItems[30309132] = {dataId=3329, type=1}	--还童丹：英招
x300028_g_petItems[30309133] = {dataId=3339, type=1}	--还童丹：麒麟
x300028_g_petItems[30309134] = {dataId=3349, type=1}	--还童丹：蛟龙
x300028_g_petItems[30309135] = {dataId=3359, type=1}	--还童丹：柴猫
x300028_g_petItems[30309136] = {dataId=3369, type=1}	--还童丹：鸡
x300028_g_petItems[30309137] = {dataId=3379, type=1}	--还童丹：鸭子
x300028_g_petItems[30309138] = {dataId=3389, type=1}	--还童丹：山羊
x300028_g_petItems[30309139] = {dataId=3399, type=1}	--还童丹：毛驴
x300028_g_petItems[30309140] = {dataId=3409, type=1}	--还童丹：鹅
x300028_g_petItems[30309141] = {dataId=3419, type=1}	--还童丹：霸王龙
x300028_g_petItems[30309142] = {dataId=3429, type=1}	--还童丹：企鹅
x300028_g_petItems[30309143] = {dataId=3439, type=1}	--还童丹：袋鼠
x300028_g_petItems[30309144] = {dataId=3449, type=1}	--还童丹：鸭嘴兽
x300028_g_petItems[30309145] = {dataId=3459, type=1}	--还童丹：猪
x300028_g_petItems[30309146] = {dataId=3469, type=1}	--还童丹：青蛙
x300028_g_petItems[30309147] = {dataId=3479, type=1}	--还童丹：小象
x300028_g_petItems[30309148] = {dataId=3489, type=1}	--还童丹：雪狐
x300028_g_petItems[30309149] = {dataId=3499, type=1}	--还童丹：狼

--**********************************
-- 返回1：技能类似的物品，可以继续类似技能的执行；返回0：执行 OnDefaultEvent。
--**********************************
function x300028_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300028_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300028_OnConditionCheck( sceneId, selfId )
	-- 校验使用的物品
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local petItem = x300028_g_petItems[itemTblIndex];
	if not petItem then
		x300028_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	local humanLevel = LuaFnGetLevel(sceneId, selfId);
	local tarPetLevel = GetPetTakeLevel(petItem.dataId);
	local tarPetName = GetPetName(petItem.dataId);
	if not humanLevel or not tarPetLevel or not tarPetName then
		x300028_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	if humanLevel < tarPetLevel then
		x300028_NotifyFailTips(sceneId, selfId, "你需要到达"..tarPetLevel.."才能携带"..tarPetName.."哦。");
		return 0;
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, petItem.dataId) == 0 then
		return 0
	end

	return 1
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x300028_OnDeplete( sceneId, selfId )
	if LuaFnDepletingUsedItem( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x300028_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local petItem = x300028_g_petItems[itemTblIndex];
	if not petItem then
		x300028_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end

	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid(sceneId, selfId);
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid(sceneId, selfId);

	LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, petItem.type, petItem.dataId)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能心跳时生效的入口
--**********************************
function x300028_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
-- 醒目失败提示
--**********************************
function x300028_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
