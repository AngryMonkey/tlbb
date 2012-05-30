--����NPC
--���

x805007_g_scriptId=805007
x805007_g_BuildingID15 = 6

--**********************************
--�¼��������
--**********************************
function x805007_OnDefaultEvent( sceneId, selfId,targetId )
	
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    ���Ұ��ڣ�һ���������ˡ��������"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "    �����������ƹ񣬱�����Ӣ�ۣ������������£����������ң��Լ����"
		AddText(sceneId,strText)
		AddNumText(sceneId,x805007_g_scriptId,"�����̵�",7,8)
		AddNumText(sceneId,x805007_g_scriptId,"ί�д���",6,9)
		AddNumText(sceneId,x805007_g_scriptId,"��߷�����",11,7)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
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
			UICommand_AddInt(sceneId,targetId) --���ó����̵����
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
