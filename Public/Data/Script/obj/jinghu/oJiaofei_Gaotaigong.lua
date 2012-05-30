-- 005114
-- ��̫�� ��կ������

--�ű���
x005114_g_scriptId = 005114

--��ӵ�е��¼�ID�б�
x005114_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x005114_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ���Ǹ���ƽ�����ߡ�")
	
	AddNumText( sceneId, x005114_g_scriptId, "����ȥ����",9 ,1  )
	
	for i, eventId in x005114_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x005114_OnDefaultEvent( sceneId, selfId,targetId )
	x005114_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x005114_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		NewWorld( sceneId, selfId, 5, 200, 52)
		return
	end

	for i, findId in x005114_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x005114_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x005114_g_eventList do
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
function x005114_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			x005114_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x005114_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x005114_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x005114_OnDie( sceneId, selfId, killerId )
end

