--城市NPC
--医院

x805016_g_scriptId=805016
x805016_g_BuildingID11 = 10

--脚本号
x805016_g_shenyi_scriptId = 64					-- “江湖游医”脚本
x805016_g_pet_dem_ScriptId	= 701603		-- “珍兽治疗”脚本

--**********************************
--事件交互入口
--**********************************
function x805016_OnDefaultEvent( sceneId, selfId,targetId )
	
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    我卢黄连曾立誓，非我帮中兄弟，外人就是病死我也不医。"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	BeginEvent(sceneId)
		strText = "    我是医舍掌柜，医者父母心，况且都是同帮自己人，歧黄之术如果感兴趣，多多切磋。"
		AddText(sceneId,strText);
		
		if CityGetBuildingLevel(sceneId, selfId, sceneId, CITY_BUILDING_YISHE) >=3 then
			AddNumText(sceneId,x805016_g_scriptId,"#G医疗",6,0)
		end
		
		AddNumText(sceneId,x805016_g_scriptId,"购买制药药方",7,6)
		AddNumText(sceneId,x805016_g_scriptId,"医舍介绍",11,7)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805016_g_scriptId,x805016_g_BuildingID11,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x805016_OnEventRequest( sceneId, selfId, targetId, eventId )

	--宠物
	if eventId == x805016_g_pet_dem_ScriptId then
		-- 调用“珍兽治疗”脚本
		CallScriptFunction( x805016_g_pet_dem_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	
		return
	end

	--处理医疗事件
	if eventId == x805016_g_shenyi_scriptId then
		-- 调用“江湖游医”脚本
		CallScriptFunction( x805016_g_shenyi_scriptId, "OnEventRequest",sceneId, selfId, targetId, GetNumText() )	
		return
	end

	--处理这个建筑物的相应生活技能选项
	if eventId ~= x805016_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805016_g_scriptId, x805016_g_BuildingID11 )
		return
	end
	if GetNumText() == 0 then
		-- 调用“江湖游医”脚本
		CallScriptFunction( x805016_g_shenyi_scriptId, "UpdateEventList",sceneId, selfId, targetId )
	elseif GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805016_g_BuildingID11, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805016_g_BuildingID11, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805016_g_BuildingID11, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805016_g_BuildingID11, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805016_g_BuildingID11, 4)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商店界面
			UICommand_AddInt(sceneId,x805016_g_BuildingID11)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_YiShe}" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805016_g_BuildingID11 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end
