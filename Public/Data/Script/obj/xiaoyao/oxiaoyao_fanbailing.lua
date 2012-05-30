--��ңNPC
--������
--��ͨ

--�ű���
x014002_g_scriptId = 014002

--��ӵ�е��¼�ID�б�
x014002_g_eventList={200040,200044}

--**********************************
--�¼��б�
--**********************************
function x014002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ƕ�ʦ�Ķ����ӣ����Է����䡣����ʲô������")
		for i, eventId in x014002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x014002_OnDefaultEvent( sceneId, selfId,targetId )
	x014002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x014002_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x014002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
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
function x014002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x014002_g_eventList do
		if missionScriptId == findId then
			x014002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x014002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x014002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x014002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x014002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x014002_OnDie( sceneId, selfId, killerId )
end
