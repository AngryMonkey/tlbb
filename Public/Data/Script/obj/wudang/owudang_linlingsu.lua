--�䵱NPC
--������
--��ͨ

--���Է帱������npc

--�ű���
x012003_g_scriptId = 012003


--��ӵ�е��¼�ID�б�
x012003_g_eventList={223901}

--**********************************
--�¼��б�
--**********************************
function x012003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.."#{OBJ_wudang_0001}")
		for i, findId in x012003_g_eventList do
			CallScriptFunction( x012003_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x012003_OnDefaultEvent( sceneId, selfId,targetId )
	x012003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x012003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x012003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x012003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x012003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x012003_g_eventList do
		if missionScriptId == findId then
			x012003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x012003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x012003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x012003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x012003_OnDie( sceneId, selfId, killerId )
end

