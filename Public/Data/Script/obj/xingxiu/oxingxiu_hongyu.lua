--����NPC
--����
--��ͨ

--���񶴸�������npc

--�ű���
x016002_g_scriptId = 016002


--��ӵ�е��¼�ID�б�
x016002_g_eventList={227901}

--**********************************
--�¼��б�
--**********************************
function x016002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." ���������кö�Ĺ���Ŷ��ֻ�����Ҹ�������ҵ�ʱ���ҲŸ�ȥ����Ҳ��ȥ��������ս��")
		for i, findId in x016002_g_eventList do
			CallScriptFunction( x016002_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x016002_OnDefaultEvent( sceneId, selfId,targetId )
	x016002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x016002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x016002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x016002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId , targetId)
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x016002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			x016002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x016002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x016002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x016002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x016002_OnDie( sceneId, selfId, killerId )
end

