--����NPC		ǧѰ
--��ͩ
--�ű���

x001080_g_ScriptId = 001080


--��ӵ�е��¼�ID�б�
x001080_g_eventList={229024,050056}

--**********************************

--�¼��б�

--**********************************

function x001080_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
			
	for i, eventId in x001080_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�¼��������

--**********************************

function x001080_OnDefaultEvent( sceneId, selfId,targetId )

	x001080_UpdateEventList( sceneId, selfId, targetId )

end



--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001080_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x001080_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001080_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001080_g_eventList do
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
function x001080_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			x001080_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001080_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001080_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001080_OnDie( sceneId, selfId, killerId )
end
