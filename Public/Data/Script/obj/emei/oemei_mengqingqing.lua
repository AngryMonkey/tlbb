--����NPC
--������
--������
--��ͨ

--�ű���
x015000_g_scriptId = 015000

--��ӵ�е��¼�ID�б�
x015000_g_eventList={226901,229009,229012,808092}

--**********************************
--�¼��б�
--**********************************
function x015000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." ������ɽɽ��֮�У���һ���һ�������ʦ������֮ǰ���µġ��������Ŷݼף����а�������������")
		for i, findId in x015000_g_eventList do
			CallScriptFunction( x015000_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x015000_OnDefaultEvent( sceneId, selfId,targetId )
	x015000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x015000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x015000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_EMEI )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x015000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x015000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			x015000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x015000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x015000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x015000_OnDie( sceneId, selfId, killerId )
end

