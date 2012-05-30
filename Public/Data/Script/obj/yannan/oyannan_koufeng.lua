--�ܷ�

--�ű���
x018001_g_scriptId = 018001


--��ӵ�е��¼�ID�б�
x018001_g_eventList={}--210902}

--**********************************
--�¼��б�
--**********************************
function x018001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  �¹ټ�����ٻ���������ż�����������յĶ����������µĻ¹ٽ�������Ȼ���������ȥ��������ƽ����գ�����С���ݹȡ�����ʱ�򣬻�������յĲݹȡ�ʱ��һ�������ǵľ����ڰ�����Ŀ��������")
	for i, eventId in x018001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x018001_OnDefaultEvent( sceneId, selfId,targetId )
	x018001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x018001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x018001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018001_g_eventList do
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
function x018001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			x018001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x018001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x018001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x018001_OnDie( sceneId, selfId, killerId )
end
