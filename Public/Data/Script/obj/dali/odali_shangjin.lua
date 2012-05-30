--�н�

--�ű���
x002019_g_scriptId = 002019


--��ӵ�е��¼�ID�б�
x002019_g_eventList={200001}

--**********************************
--�¼��б�
--**********************************
function x002019_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"{ID=shangjin_01}")
	--�ҿ��Խ���һЩ������������ð�յ�֪ʶ,ϣ����Щ֪ʶ�������������.");
	for i, eventId in x002019_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002019_OnDefaultEvent( sceneId, selfId,targetId )
	x002019_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002019_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002019_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002019_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002019_g_eventList do
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
function x002019_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002019_g_eventList do
		if missionScriptId == findId then
			x002019_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002019_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002019_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002019_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002019_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002019_OnDie( sceneId, selfId, killerId )
end
