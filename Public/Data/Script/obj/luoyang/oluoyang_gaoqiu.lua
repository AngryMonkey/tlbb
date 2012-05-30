--��ٴ

--�ű���
x000003_g_scriptId = 000003

--��ӵ�е��¼�ID�б�
x000003_g_eventList={201211,201312}		

--**********************************
--�¼��б�
--**********************************
function x000003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  ͯ�����Ѿ��ڶ�����ǰ�ټ����ˣ��ҵĻ������ˣ�ֻҪ������ң��ٻ������Ժ�ɾ���֮�����ˣ�������");
	for i, eventId in x000003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000003_OnDefaultEvent( sceneId, selfId,targetId )
	x000003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000003_g_eventList do
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
function x000003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000003_g_eventList do
		if missionScriptId == findId then
			x000003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000003_OnDie( sceneId, selfId, killerId )
end
