-- 019033
-- �µ�

--�ű���
x019033_g_scriptId = 019033

--��ӵ�е��¼�ID�б�
x019033_g_eventList={212220}



--**********************************
--�¼��б�
--**********************************
function x019033_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���뻻�ҵı��������µ�׼��һ�������������У��Ƕ�����Ĺ�����ǣ��Ϳ�����û�������ó����ˡ�");
		for i, eventId in x019033_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x019033_OnDefaultEvent( sceneId, selfId,targetId )
	x019033_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x019033_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x019033_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x019033_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019033_g_eventList do
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
function x019033_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x019033_g_eventList do
		if missionScriptId == findId then
			x019033_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x019033_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x019033_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x019033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x019033_OnDie( sceneId, selfId, killerId )
end

