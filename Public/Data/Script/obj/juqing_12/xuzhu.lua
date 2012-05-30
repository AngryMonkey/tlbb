--038001 

-- ���� 038001

--�ű���
x038001_g_scriptId = 038001

--��ӵ�е��¼�ID�б�
x038001_g_eventList={200055, 200056}

--**********************************
--�¼��б�
--**********************************
function x038001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_YPT_B_001}")
	for i, eventId in x038001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x038001_OnDefaultEvent( sceneId, selfId,targetId )
	x038001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x038001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x038001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x038001_OnMissionAccept( sceneId, selfId, targetId  )
	for i, findId in x038001_g_eventList do
		ret = CallScriptFunction(findId , "CheckAccept", sceneId, selfId, targetId )
		if ret > 0 then
			CallScriptFunction( findId, "OnAccept", sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x038001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x038001_g_eventList do
		if missionScriptId == findId then
			x038001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x038001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x038001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x038001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x038001_OnDie( sceneId, selfId, killerId )
end
