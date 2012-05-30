-- 双倍经验时间药水
-- 消耗一个药水，

--脚本号
x300039_g_scriptId = 300039
x300039_g_ItemId = 30008002
x300039_g_ItemId_1 = 30008027
x300039_g_ItemId_2 = 30505214

x300039_g_BuffPalyer_25 = 60
x300039_g_BuffAll_15 = 62
x300039_g_BuffPet_25 = 61
x300039_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300039_OnDefaultEvent( sceneId, selfId, nItemIndex)

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300039_g_BuffPalyer_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"您身上已经存在了更高效率的多倍经验时间！")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300039_g_BuffAll_15) == 1   then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300039_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"您身上已经存在了多倍经验时间，是否确认使用？");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)

		return
	end
	
	x300039_UseItem( sceneId, selfId, nItemIndex)
	
end

function x300039_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300039_EatMe( sceneId, selfId, nItemIndex)
	x300039_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300039_UseItem( sceneId, selfId, nItemIndex)
	-- 先检测这个 nItemIndex 的物品是不是和当前的对应，
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId ~= x300039_g_ItemId and nItemId ~= x300039_g_ItemId_1 and nItemId ~= x300039_g_ItemId_2 then
		BeginEvent(sceneId)
			AddText(sceneId,"  背包内部错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--1，看玩家是不是当前的身上的双倍经验时间是多少，如果达到上限，就不能使用
	local nCurHaveTime = DEGetMoneyTime(sceneId, selfId)
	
	if nCurHaveTime >= 99*60*60   then
		BeginEvent(sceneId)
			AddText(sceneId,"  您当前使用“天灵丹”获得的双倍经验时间已经到达上限。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--符合使用这个物品的条件，
	local ret = EraseItem(sceneId, selfId, nItemIndex)
		
	-- 现在时间
	local nCurTime = LuaFnGetCurrentTime()

	if ret == 1    then
		DESetMoneyTime(sceneId, selfId, nCurHaveTime + 3600 )
		
		-- 如果玩家当前的双倍经验时间是被冻结的，给玩家一个提示
		if 1 == DEIsLock(sceneId, selfId)  then
			DESetLock( sceneId, selfId, 0 )
			BeginEvent(sceneId)
				AddText(sceneId,"您冻结的双倍时间已经解冻，并增加了一小时的双倍经验时间。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		else
			BeginEvent(sceneId)
				AddText(sceneId,"您增加了一个小时的双倍经验时间。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		end
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	-- 同步数据到客户端
	SendDoubleExpToClient(sceneId,selfId)
end

