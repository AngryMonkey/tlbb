--����NPC
--�Ƶ�

x805018_g_scriptId=805018
x805018_g_BuildingID13 = 2

--**********************************
--�¼��������
--**********************************
function x805018_OnDefaultEvent( sceneId, selfId,targetId )

	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    ���Ұ��ڣ�����ˡ���Ӵ���"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "    ���Ǿ������ƹ񣬺������ƣ���Ҷ���һ����ģ���ʲô�������ص����񣬲��������ҡ�"
		AddText(sceneId,strText);
		AddNumText(sceneId,x805018_g_scriptId,"�������ʳ��",7,6)
		AddNumText(sceneId,x805018_g_scriptId,"��������",11,7)
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805018_g_scriptId,x805018_g_BuildingID13,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805018_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����������������Ӧ�����ѡ��
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
			UICommand_AddInt(sceneId,targetId) --���ó����̵����
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
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805018_g_BuildingID13 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end
