--�շ�

--�ű���
x030003_g_scriptId = 030003

--��ӵ�е��¼�ID�б�
x030003_g_eventList={212100, 808095, 808096, 808097, 808094}
-- 212100  �շɵ�����

--**********************************
--�¼��б�
--**********************************
function x030003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  ����#Rˮ��#W��Ȼ�������࣬�������Ǻ�����һ�����Լ���˼�����Լ���������ǲ��������ͺ�ս�����塣")
	for i, eventId in x030003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x030003_OnDefaultEvent( sceneId, selfId,targetId )
	x030003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x030003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x030003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x030003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x030003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			x030003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x030003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x030003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x030003_OnDie( sceneId, selfId, killerId )
end
