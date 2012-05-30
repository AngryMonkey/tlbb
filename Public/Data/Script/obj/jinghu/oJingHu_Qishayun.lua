-- 005113
-- ��ɷ��

--�ű���
x005113_g_scriptId = 005113

--��ӵ�е��¼�ID�б�
x005113_g_eventList={402030}

--**********************************
--�¼��б�
--**********************************
function x005113_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  �Ҵӳ�͢����������˽��𾵺�ˮ������������ļ���¸����ɵ���־֮ʿ���н˷ˡ�")
	for i, eventId in x005113_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x005113_OnDefaultEvent( sceneId, selfId,targetId )
	x005113_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x005113_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x005113_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x005113_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x005113_g_eventList do
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
function x005113_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x005113_g_eventList do
		if missionScriptId == findId then
			x005113_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x005113_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x005113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x005113_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x005113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x005113_OnDie( sceneId, selfId, killerId )
end
