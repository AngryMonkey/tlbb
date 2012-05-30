--��ٹ� ������

--�ű���
x118002_g_scriptId = 118002

--��ӵ�е��¼�ID�б�
x118002_g_eventList={200002, 200006, 200007}

--**********************************
--�¼��б�
--**********************************
function x118002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)

	if IsMissionHaveDone(sceneId,selfId,7) == 1 then
		AddText(sceneId,"#{JQ_WJG_B_007}")
	else
		AddText(sceneId,"#{JQ_WJG_B_006}")
	end

	for i, eventId in x118002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��������
--**********************************
function x118002_OnDefaultEvent( sceneId, selfId,targetId )
	x118002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x118002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x118002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x118002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118002_g_eventList do
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
function x118002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			x118002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x118002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x118002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x118002_OnDie( sceneId, selfId, killerId )
end
