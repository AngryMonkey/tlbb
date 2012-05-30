--�ɱ�

--�ű���
x019005_g_scriptId = 019003


--��ӵ�е��¼�ID�б�
x019005_g_eventList={}--211001,211006,211007}

--**********************************
--�¼��б�
--**********************************
function x019005_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
	AddText(sceneId,"  #{Lua_yanbei_0007}")
	for i, eventId in x019005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x019005_OnDefaultEvent( sceneId, selfId,targetId )
	x019005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x019005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x019005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x019005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019005_g_eventList do
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
function x019005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x019005_g_eventList do
		if missionScriptId == findId then
			x019005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x019005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x019005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x019005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x019005_OnDie( sceneId, selfId, killerId )

end

