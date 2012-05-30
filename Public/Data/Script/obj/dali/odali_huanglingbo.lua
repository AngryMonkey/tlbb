--����NPC		����npc		1ѧϰ���Ҽ���		2��ҽ����˵��
--��籲�
--�����npc

--�ű���
x002063_g_ScriptId = 002063

--�̵���
x002063_g_shoptableindex=62

--��ӵ�е��¼�Id�б�
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--��ӵ�е��¼�ID�б�
x002063_g_eventList={713506,713565,713605}
--**********************************
--�¼��б�
--**********************************
function x002063_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0038}")
	for i, eventId in x002063_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x002063_g_ScriptId,"�������ͼ",7,ABILITY_TEACHER_SHOP)
  AddNumText(sceneId,x002063_g_ScriptId,"#{INTERFACE_XML_1195}",7,12)     
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002063_OnDefaultEvent( sceneId, selfId,targetId )
	x002063_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002063_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x002063_g_shoptableindex )
	elseif	GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 200 )  
	end
	for i, findId in x002063_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002063_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002063_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x002063_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			x002063_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002063_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002063_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002063_OnDie( sceneId, selfId, killerId )
end
