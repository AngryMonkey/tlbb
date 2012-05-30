--城市NPC
--防具

x805011_g_scriptId=805011
x805011_g_BuildingID5 = 4

--**********************************
--事件交互入口
--**********************************
function x805011_OnDefaultEvent( sceneId, selfId,targetId )

	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    非我帮众，一切精良装备恕不外卖。"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent(sceneId)
		strText = "    我是防具店的大掌柜，有何指教？有防具有关的事，找我周无忌肯定没错。"
		AddText(sceneId,strText);
		AddNumText(sceneId,x805011_g_scriptId,"神秘商店",7,7)
		AddNumText(sceneId,x805011_g_scriptId,"委托打造",6,8)
		AddNumText(sceneId,x805011_g_scriptId,"帮会装",6,9)
		AddNumText(sceneId,x805011_g_scriptId,"防具坊介绍",11,6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x805011_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 4)
	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_FangJuFang}" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 9 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
end
