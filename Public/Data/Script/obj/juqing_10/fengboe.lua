-- �粨�� 117010

--�ű���
x117010_g_scriptId = 117010

--��ӵ�е��¼�ID�б�
x117010_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x117010_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_LGS_Y_012}")
	for i, eventId in x117010_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x117010_OnDefaultEvent( sceneId, selfId,targetId )
	x117010_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x117010_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x117010_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x117010_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117010_g_eventList do
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
function x117010_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x117010_g_eventList do
		if missionScriptId == findId then
			x117010_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x117010_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117010_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x117010_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x117010_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x117010_OnDie( sceneId, selfId, killerId )
end
