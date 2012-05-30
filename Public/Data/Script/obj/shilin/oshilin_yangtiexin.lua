--ʯ�� ������

--�ű���
x026007_g_scriptId = 026007

--��ӵ�е��¼�ID�б�
x026007_g_eventList={212124}--211705	

--**********************************
--�¼��б�
--**********************************
function x026007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    ��Ҫ�£��Ҳ����˺���ġ���������ҲҪ��ŵ���˺��ҡ���")	
		for i, eventId in x026007_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x026007_OnDefaultEvent( sceneId, selfId,targetId )
	x026007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x026007_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x026007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x026007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026007_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x026007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x026007_g_eventList do
		if missionScriptId == findId then
			x026007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x026007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x026007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x026007_OnDie( sceneId, selfId, killerId )
end
