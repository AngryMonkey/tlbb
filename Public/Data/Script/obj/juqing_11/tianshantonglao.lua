-- 115003

-- ��ɽͬ�� 115003

--�ű���
x115003_g_scriptId = 115003

--��ӵ�е��¼�ID�б�
x115003_g_eventList={200051,200097}

--**********************************
--�¼��б�
--**********************************
function x115003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YPT_Y_003}")
	for i, eventId in x115003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x115003_OnDefaultEvent( sceneId, selfId,targetId )
	x115003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x115003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x115003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x115003_OnMissionAccept( sceneId, selfId, targetId )

	for i, findId in x115003_g_eventList do
		ret = CallScriptFunction( findId, "CheckAccept", sceneId, selfId, targetId )
		if ret > 0 then
			CallScriptFunction( findId, "OnAccept", sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x115003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x115003_g_eventList do
		if missionScriptId == findId then
			x115003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x115003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x115003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x115003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x115003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x115003_OnDie( sceneId, selfId, killerId )
end
