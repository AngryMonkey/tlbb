--��ٹ� ������

--�ű���
x118003_g_scriptId = 118003

--��ӵ�е��¼�ID�б�
x118003_g_eventList={200008, 200007}

--**********************************
--�¼��б�
--**********************************
function x118003_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_WJG_B_008}")
	for i, eventId in x118003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��������
--**********************************
function x118003_OnDefaultEvent( sceneId, selfId,targetId )
	x118003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x118003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x118003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x118003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId,targetId  )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x118003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			x118003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x118003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( findId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x118003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( findId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x118003_OnDie( sceneId, selfId, killerId )
end
