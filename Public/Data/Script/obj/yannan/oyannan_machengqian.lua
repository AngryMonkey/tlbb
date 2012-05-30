--���ٻ

--�ű���
x018002_g_scriptId = 018002


--��ӵ�е��¼�ID�б�
x018002_g_eventList={212120}--210904

--**********************************
--�¼��б�
--**********************************
function x018002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  �⼸ƥ��������������ʵػ����ԣ��ţ�����ͷС�����ǳ��ɿڡ������ȥ���ۼ�������")
	for i, eventId in x018002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x018002_OnDefaultEvent( sceneId, selfId,targetId )
	x018002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x018002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x018002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018002_g_eventList do
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
function x018002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x018002_g_eventList do
		if missionScriptId == findId then
			x018002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x018002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x018002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x018002_OnDie( sceneId, selfId, killerId )
end
