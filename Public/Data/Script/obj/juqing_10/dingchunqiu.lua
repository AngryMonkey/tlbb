-- ������ 	117017

--�ű���
x117017_g_scriptId = 117017

--��ӵ�е��¼�ID�б�
x117017_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x117017_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_LGS_Y_018}")
	for i, eventId in x117017_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x117017_OnDefaultEvent( sceneId, selfId,targetId )
	x117017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x117017_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x117017_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x117017_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117017_g_eventList do
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
function x117017_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x117017_g_eventList do
		if missionScriptId == findId then
			x117017_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x117017_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117017_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x117017_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x117017_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x117017_OnDie( sceneId, selfId, killerId )
end
