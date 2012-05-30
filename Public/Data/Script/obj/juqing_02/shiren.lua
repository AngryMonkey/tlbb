--ʯͷ��

--�ű���
x118015_g_scriptId = 118015

--��ӵ�е��¼�ID�б�
x118015_g_eventList={200008}

--**********************************
--�¼��б�
--**********************************
function x118015_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		--��3�仰�����ѡ��1��
		local rand = random( 3 )
		if rand == 1  then
			AddText(sceneId,"#{JQ_WJG_B_003}")
		
		elseif rand == 2   then
			AddText(sceneId,"#{JQ_WJG_B_004}")
		
		elseif rand == 3   then
			AddText(sceneId,"#{JQ_WJG_B_005}")
		
		end
	for i, eventId in x118015_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x118015_OnDefaultEvent( sceneId, selfId,targetId )
	x118015_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x118015_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x118015_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x118015_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118015_g_eventList do
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
function x118015_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x118015_g_eventList do
		if missionScriptId == findId then
			x118015_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x118015_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118015_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x118015_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118015_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x118015_OnDie( sceneId, selfId, killerId )
end
