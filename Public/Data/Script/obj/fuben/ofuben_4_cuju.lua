-- 402041
-- ͯ��
--���縱������npc

--�ű���
x402041_g_scriptId = 402041


--��ӵ�е��¼�ID�б�
x402041_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x402041_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{CUJU_20071012}")

		local nSceneId = LuaFnGetCopySceneData_Param(sceneId, 3)
	
		if nSceneId == 0  then
			AddNumText( sceneId, x402041_g_scriptId, "���һ�����", 9, 10 )
		elseif nSceneId == 1  then
			AddNumText( sceneId, x402041_g_scriptId, "���һ�����", 9, 11 )
		elseif nSceneId == 2  then
			AddNumText( sceneId, x402041_g_scriptId, "���һش���", 9, 12 )
		end
		
		for i, findId in x402041_g_eventList do
			CallScriptFunction( x402041_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402041_OnDefaultEvent( sceneId, selfId,targetId )
	x402041_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402041_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,204,59)
		return
	end
	
	if GetNumText() == 11  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,185,148)
		return
	end
	
	if GetNumText() == 12  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,280,95)
		return
	end
	
	
	for i, findId in x402041_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402041_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402041_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x402041_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402041_g_eventList do
		if missionScriptId == findId then
			x402041_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402041_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402041_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402041_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402041_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402041_OnDie( sceneId, selfId, killerId )
end
