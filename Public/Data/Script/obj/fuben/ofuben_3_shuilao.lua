--ˮ�θ�������npc

--�ű���
x402020_g_scriptId = 402020


--��ӵ�е��¼�ID�б�
x402020_g_eventList={401020}

--**********************************
--�¼��б�
--**********************************
function x402020_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." �����ɡ�\n")
		for i, findId in x402020_g_eventList do
			CallScriptFunction( x402020_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402020_OnDefaultEvent( sceneId, selfId,targetId )
	x402020_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402020_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402020_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402020_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x402020_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			x402020_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402020_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402020_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402020_OnDie( sceneId, selfId, killerId )
end
