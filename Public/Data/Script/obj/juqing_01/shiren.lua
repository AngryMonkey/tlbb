--��ٹ�ʯ�ҵ�

--�ű���
x119003_g_scriptId = 119003

--��ӵ�е��¼�ID�б�
x119003_g_eventList={200004, 200003}

--**********************************
--�¼��б�
--**********************************
function x119003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		--��3�仰�����ѡ��1��
		local rand = random( 3 )
		if rand == 1  then
			AddText(sceneId,"#{JQ_WJG_Y_003}")
		
		elseif rand == 2   then
			AddText(sceneId,"#{JQ_WJG_Y_004}")
		
		elseif rand == 3   then
			AddText(sceneId,"#{JQ_WJG_Y_005}")
		
		end
	for i, eventId in x119003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x119003_OnDefaultEvent( sceneId, selfId,targetId )
	x119003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x119003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x119003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x119003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId)
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x119003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x119003_g_eventList do
		if missionScriptId == findId then
			x119003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x119003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	for i, findId in x119003_g_eventList do
		if 200003 == findId then
			CallScriptFunction( 200003, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x119003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119003_g_eventList do
		if 200003 == findId then
			CallScriptFunction( 200003, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x119003_OnDie( sceneId, selfId, killerId )
end
