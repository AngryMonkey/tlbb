--修装备

function x801015_OnService( sceneId, selfId, itemId, platformType )
--一些条件判断
--修理
--完成
	local tArray = {}
	tArray[1] = {0}
	tArray[2] = {1,2,3,4,5,14,15}
	tArray[3] = {6,7,11,12,13}
	
	local tArray_Text = {"铸造台只能修理武器。","缝纫台只能修理防具。","工艺台只能修理饰品。"}
	local tArray_Ability = {"铸造","缝纫","工艺"}
	local nLevel =GetBagItemLevel(sceneId, selfId,itemId)
	local EquipType = LuaFnGetBagEquipType(sceneId, selfId, itemId)
	local find = 0

	for i, item in tArray[platformType] do
		if item == EquipType then
			find =1
		end
	end
	
	if find == 0 then
		BeginEvent(sceneId)
		AddText(sceneId,tArray_Text[platformType])
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if nLevel < 40 then
		BeginEvent(sceneId)
		AddText(sceneId,"只能修理需求等级>=40级的装备")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	ret = DoRepair( sceneId, selfId, itemId, platformType )

	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"该装备无法再次修理")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -2 then
		BeginEvent(sceneId)
		AddText(sceneId,"你的"..tArray_Ability[platformType].."技能等级不足")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -3 then
		BeginEvent(sceneId)
		AddText(sceneId,"没有足够的活力")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -4 then
		BeginEvent(sceneId)
		AddText(sceneId,"很不幸，在修复过程中，由于你运气不好，使这件#{_ITEM"..LuaFnGetItemTableIndexByIndex(sceneId,selfId,itemId).."}受了些许磨损。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif ret == -5 then
		BeginEvent(sceneId)
		AddText(sceneId,"修理过程中出现未知错误")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -6 then
		BeginEvent(sceneId)
		AddText(sceneId,"物品没有损害，不用修理")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"经过你精心的修复，这件#{_ITEM"..LuaFnGetItemTableIndexByIndex(sceneId,selfId,itemId).."}已经修好了。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		Msg2Player(  sceneId, selfId,"消耗"..floor(nLevel/10+5).."活力",MSG2PLAYER_PARA )
	end
	
end
