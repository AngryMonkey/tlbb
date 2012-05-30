--����NPC
--����

x805011_g_scriptId=805011
x805011_g_BuildingID5 = 4

--**********************************
--�¼��������
--**********************************
function x805011_OnDefaultEvent( sceneId, selfId,targetId )

	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    ���Ұ��ڣ�һ�о���װ��ˡ��������"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent(sceneId)
		strText = "    ���Ƿ��ߵ�Ĵ��ƹ��к�ָ�̣��з����йص��£��������޼ɿ϶�û��"
		AddText(sceneId,strText);
		AddNumText(sceneId,x805011_g_scriptId,"�����̵�",7,7)
		AddNumText(sceneId,x805011_g_scriptId,"ί�д���",6,8)
		AddNumText(sceneId,x805011_g_scriptId,"���װ",6,9)
		AddNumText(sceneId,x805011_g_scriptId,"���߷�����",11,6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
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
		AddText( sceneId, "������ܼ�������" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 9 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
end
