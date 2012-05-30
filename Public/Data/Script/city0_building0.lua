--城市NPC
--武具

x805007_g_scriptId=805007
x805007_g_BuildingID15 = 6

--**********************************
--事件交互入口
--**********************************
function x805007_OnDefaultEvent( sceneId, selfId,targetId )
	
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    非我帮众，一切神兵利刃恕不外卖。"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "    我是武器店掌柜，宝剑配英雄，天下名兵诸事，都可以找我，自己人嘛。"
		AddText(sceneId,strText)
		AddNumText(sceneId,x805007_g_scriptId,"神秘商店",7,8)
		AddNumText(sceneId,x805007_g_scriptId,"委托打造",6,9)
		AddNumText(sceneId,x805007_g_scriptId,"武具坊介绍",11,7)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x805007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 4)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商店界面
			UICommand_AddInt(sceneId,x805007_g_BuildingID15)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_WuJuFang}" )		
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
