-- 人物2.5经验时间药水

--脚本号
x300046_g_scriptId = 300046
x300046_g_ItemId = 30008014
x300046_g_BuffId = 60

x300046_g_BuffPalyer_25 = 60
x300046_g_BuffAll_15 = 62
x300046_g_BuffPet_25 = 61
x300046_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300046_OnDefaultEvent( sceneId, selfId, nItemIndex )

	-- 如果有自己，就不让再吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300046_g_BuffPalyer_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"你已经使用了多倍经验药物，请在效果消失后再使用。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 如果玩家身上有 双倍经验时间  ，提示玩家要不要吃
	local nCurHaveTime = DEGetMoneyTime(sceneId, selfId)
	if nCurHaveTime > 0  and  DEIsLock(sceneId, selfId)~=1  then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300046_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"您身上已经存在了多倍经验时间，是否确认使用？");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300046_g_BuffAll_15) == 1   then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300046_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"您身上已经存在了多倍经验时间，是否确认替换？");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	x300046_UseItem( sceneId, selfId, nItemIndex)
end

function x300046_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300046_EatMe( sceneId, selfId, nItemIndex)
	x300046_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300046_UseItem( sceneId, selfId, nItemIndex)
	-- 先检测这个 nItemIndex 的物品是不是和当前的对应，
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300046_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  背包内部错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 扣一个药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300046_g_BuffId, 100 )
		BeginEvent(sceneId)
			AddText(sceneId,"您增加了一个小时的人物2.5经验时间。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

