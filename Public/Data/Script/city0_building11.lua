--城市NPC
--酒店

x805018_g_scriptId=805018
x805018_g_BuildingID13 = 2

--**********************************
--事件交互入口
--**********************************
function x805018_OnDefaultEvent( sceneId, selfId,targetId )

	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    非我帮众，酒肉恕不接待。"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "    我是酒肆的掌柜，和气生财，大家都是一个帮的，有什么与烹饪相关的事务，不妨来找我。"
		AddText(sceneId,strText);
		AddNumText(sceneId,x805018_g_scriptId,"购买烹饪食谱",7,6)
		AddNumText(sceneId,x805018_g_scriptId,"酒肆介绍",11,7)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805018_g_scriptId,x805018_g_BuildingID13,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x805018_OnEventRequest( sceneId, selfId, targetId, eventId )
	--处理这个建筑物的相应生活技能选项
	if eventId ~= x805018_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805018_g_scriptId, x805018_g_BuildingID13 )
		return
	end
	
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 4)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商店界面
			UICommand_AddInt(sceneId,x805018_g_BuildingID13)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_JiuSi}" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805018_g_BuildingID13 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end
