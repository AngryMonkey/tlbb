--������
--������

--�ű���
x011000_g_scriptId = 011000

--��ӵ�е��¼�ID�б�
x011000_g_eventList={229009, 229012, 808092}
--x011000_g_eventList={201011,201012,210408,808004, 229012}

--**********************************
--�¼��б�
--**********************************
function x011000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"�����ˣ�����ʲô������");
	for i, eventId in x011000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x011000_OnDefaultEvent( sceneId, selfId,targetId )
	x011000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x011000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x011000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_MINGJIAO )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x011000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011000_g_eventList do
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
function x011000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x011000_g_eventList do
		if missionScriptId == findId then
			x011000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x011000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x011000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x011000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x011000_OnDie( sceneId, selfId, killerId )
end
