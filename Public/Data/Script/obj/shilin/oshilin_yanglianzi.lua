--ʯ�� ������

--�ű���
x026003_g_scriptId = 026003

--��ӵ�е��¼�ID�б�
x026003_g_eventList={}--211701	

--**********************************
--�¼��б�
--**********************************
function x026003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		
	AddText(sceneId, "  Ϊʲô����Ϊʲô����#r  �ҵİ�ë������#r  ��Բ����㰡����#r  ��ë����#r  ���������ء���")	
	
	for i, eventId in x026003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x026003_OnDefaultEvent( sceneId, selfId,targetId )
	x026003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x026003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x026003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x026003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026003_g_eventList do
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
function x026003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x026003_g_eventList do
		if missionScriptId == findId then
			x026003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x026003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x026003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x026003_OnDie( sceneId, selfId, killerId )
end
