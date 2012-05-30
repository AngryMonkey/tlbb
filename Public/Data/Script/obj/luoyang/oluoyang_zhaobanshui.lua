--����NPC
--�԰�ˮ


--�ű���
x000146_g_scriptId = 000146

--��ӵ�е��¼�ID�б�
x000146_g_eventList={050044,
					 889053, --��ǰ��
					 }

--**********************************
--�¼��б�
--**********************************
function x000146_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{CWDB_20080225_01}") --�԰�ˮ�Ի��޸�Ϊ,�߻��ֵ��޸ľͿ�����
	for i, eventId in x000146_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�¼��������
--**********************************
function x000146_OnDefaultEvent( sceneId, selfId, targetId )
	x000146_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000146_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000146_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000146_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000146_g_eventList do
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
function x000146_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000146_g_eventList do
		if missionScriptId == findId then
			x000146_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000146_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000146_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000146_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000146_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000146_OnDie( sceneId, selfId, killerId )
end
