--³ƽ


--�ű���
x024002_g_scriptId = 024002

--��ӵ�е��¼�ID�б�
x024002_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x024002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ��һ�����ҵ���Щ��ҩ�ģ���Ҫ�󰢰�һ������Ϊ��Ҷ��𾴵�Ӣ�ۣ�")
	for i, eventId in x024002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x024002_OnDefaultEvent( sceneId, selfId,targetId )
	x024002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x024002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x024002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024002_g_eventList do
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
function x024002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x024002_g_eventList do
		if missionScriptId == findId then
			x024002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x024002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x024002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x024002_OnDie( sceneId, selfId, killerId )
end

