-- 300057
-- 干坤杯 使用

--脚本号
x300057_g_scriptId = 300057

x300057_g_ItemId = 30008033

x300057_g_BuffId = 8500
x300057_g_BuffId_1 = 57

--**********************************
--事件交互入口
--**********************************
function x300057_OnDefaultEvent( sceneId, selfId, nItemIndex )

	-- 如果身上有 8500 或者 57 号BUFF 就不能再吃这个药
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300057_g_BuffId) == 1 or
		 LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300057_g_BuffId_1) == 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"只有等自动捡取物品效果消失之后才能使用。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	x300057_UseItem( sceneId, selfId, nItemIndex)
end

function x300057_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
-- 
--**********************************
function x300057_UseItem( sceneId, selfId, nItemIndex)
	
	-- 先检测这个 nItemIndex 的物品是不是和当前的对应，
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId ~= x300057_g_ItemId   then
		BeginEvent(sceneId)
			AddText(sceneId,"  背包内部错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 扣一个药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300057_g_BuffId, 100 )
		--BeginEvent(sceneId)
		--	AddText(sceneId,"您增加了一个小时的宠物双倍经验时间。")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end


