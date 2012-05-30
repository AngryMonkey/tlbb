--³ƽ


--�ű���
x024001_g_scriptId = 024001

--��ӵ�е��¼�ID�б�
x024001_g_eventList={808099, 808100, 808101, 808094}

--**********************************
--�¼��б�
--**********************************
function x024001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  �����ˣ�������ɲ�Ҫ���ܰ���#r  Ұ�˺����˿ɶ����Ǻ��ǵģ��������Ǵ������ڵ�״�������֪����Щ�������ж��׺��ˡ�#r  ǰ���������·�в�������ܶ����˴��������Ͳ�ҶȥңԶ���������ǰʱ��ʱ�ľ�����Ӵ����ﾭ�������������Դ�����Զ��Զ����")
	for i, eventId in x024001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x024001_OnDefaultEvent( sceneId, selfId,targetId )
	x024001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x024001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x024001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024001_g_eventList do
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
function x024001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			x024001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x024001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x024001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x024001_OnDie( sceneId, selfId, killerId )
end

