-- 宠物双倍经验时间药水
-- 消耗一个药水，为宠物提供一个小时双倍经验时间

--脚本号
x300040_g_scriptId = 300040
x300040_g_ItemId = 30008003
x300040_g_ItemId_1 = 30008028

x300040_g_BuffId = 53

x300040_g_BuffPalyer_25 = 60
x300040_g_BuffAll_15 = 62
x300040_g_BuffPet_25 = 61
x300040_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300040_OnDefaultEvent( sceneId, selfId, nItemIndex )

	-- 如果身上有2.5的，就不让吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300040_g_BuffPet_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"您身上已经存在了更高效率的多倍经验时间！")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 有相同的，也不让再吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300040_g_BuffPet_2) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"你已经使用了多倍经验药物，请在效果消失后再使用。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	x300040_UseItem( sceneId, selfId, nItemIndex)
end

function x300040_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300040_EatMe( sceneId, selfId, nItemIndex)
	x300040_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300040_UseItem( sceneId, selfId, nItemIndex)
	
	-- 先检测这个 nItemIndex 的物品是不是和当前的对应，
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId ~= x300040_g_ItemId and nItemId ~= x300040_g_ItemId_1   then
		BeginEvent(sceneId)
			AddText(sceneId,"  背包内部错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 扣一个药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300040_g_BuffId, 100 )
		BeginEvent(sceneId)
			AddText(sceneId,"您增加了一个小时的宠物双倍经验时间。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

