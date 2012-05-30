--����NPC
--����

x805010_g_scriptId=805008
x805010_g_BuildingID4 = 11

--**********************************
--�¼��������
--**********************************
function x805010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddNumText(sceneId,x805010_g_scriptId,"���ý�����һ��",-1,1)
		--AddNumText(sceneId,x805010_g_scriptId,"���ý���������",-1,2)
		--AddNumText(sceneId,x805010_g_scriptId,"���ý���������",-1,3)
		--AddNumText(sceneId,x805010_g_scriptId,"���ý������ļ�",-1,4)
		--AddNumText(sceneId,x805010_g_scriptId,"���ý������弶",-1,5)
		AddNumText(sceneId,x805010_g_scriptId,"�䷽�̵�",7,6)
		
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805010_g_scriptId,x805010_g_BuildingID4,7)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805010_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����������������Ӧ�����ѡ��
	if eventId ~= x805010_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805010_g_scriptId, x805010_g_BuildingID4 )
		return
	end
	
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805010_g_BuildingID4, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805010_g_BuildingID4, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805010_g_BuildingID4, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805010_g_BuildingID4, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805010_g_BuildingID4, 4)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó����̵����
			UICommand_AddInt(sceneId,x805010_g_BuildingID4)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805010_g_BuildingID4 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
	
end
