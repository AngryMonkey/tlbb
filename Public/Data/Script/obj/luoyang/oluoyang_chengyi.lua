--����NPC
--����
--��ͨ

--�ű���
x000009_g_ScriptId = 000009

x000009_g_eventList={250510}
--**********************************
--�¼��б�
--**********************************
function x000009_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0006}")
	for i, eventId in x000009_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000009_OnDefaultEvent( sceneId, selfId,targetId )
	x000009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000009_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000009_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000009_g_eventList do
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
function x000009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000009_g_eventList do
		if missionScriptId == findId then
			x000009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000009_OnDie( sceneId, selfId, killerId )
end
