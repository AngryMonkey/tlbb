--³ƽ


--�ű���
x031009_g_scriptId = 031009

--��ӵ�е��¼�ID�б�
x031009_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x031009_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Ů�ˣ�Խ��Ư����Ů�ˣ���Խ��ƭ�ˡ�ֻ��һ�ֶ�������ƭ�ˡ����ٺ٣����Ǿƣ�")
	for i, eventId in x031009_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x031009_OnDefaultEvent( sceneId, selfId,targetId )
	x031009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x031009_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x031009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031009_g_eventList do
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
function x031009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x031009_g_eventList do
		if missionScriptId == findId then
			x031009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x031009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x031009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x031009_OnDie( sceneId, selfId, killerId )
end

