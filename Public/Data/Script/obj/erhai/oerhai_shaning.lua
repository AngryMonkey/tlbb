--³ƽ


--�ű���
x024004_g_scriptId = 024004

--��ӵ�е��¼�ID�б�
x024004_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x024004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ���Ǹ��¶�������û�м������ֺͰ��裬��������Ҵ�С��������ģ�������Ҿ�����������һ������һ��Ҫ�ҵ�����#r  ��������������Է������һ���ùõĻ����Ǹ��ùú�Ư����������ÿ�κ����˾ͻ�һֱ�����Ƿ�����һֱ����#r  ����᲻��ȥ���Ǹ��ù��ˣ�")
	for i, eventId in x024004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x024004_OnDefaultEvent( sceneId, selfId,targetId )
	x024004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x024004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x024004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024004_g_eventList do
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
function x024004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			x024004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x024004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x024004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x024004_OnDie( sceneId, selfId, killerId )
end

