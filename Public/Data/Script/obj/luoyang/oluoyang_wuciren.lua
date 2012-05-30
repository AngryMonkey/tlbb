--NPC
--
--�ű���
x000149_g_scriptId = 000149

--��ӵ�е��¼�ID�б�
x000149_g_eventList={500600}

--��ͨ

--**********************************
--�¼��������
--**********************************
function x000149_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  �ڼҿ���ĸ�����ſ����ѡ����߽���������Ϊ��Ȼ��Ҫ�����м�����ϵ���ܵ�����ȴ�Ǳز����ٵġ�����־Ȥ��Ͷ�ĺ��ѣ��������������ֵܣ�����ͬ��ͬ�ɵ����ˡ�Ī��Ľ������������ҵ���������Я��ͬ�Ρ���ͬ���˵�֪�����������������������������������һ����£�")
		
		for i, eventId in x000149_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000149_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000149_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000149_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000149_g_eventList do
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
function x000149_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			x000149_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000149_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000149_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000149_OnDie( sceneId, selfId, killerId )
end
