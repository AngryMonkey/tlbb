--120001

-- ��ãɽ������

--�ű���
x120001_g_scriptId = 120001

--��ӵ�е��¼�ID�б�
x120001_g_eventList={200035, 200036}

--**********************************
--�¼��б�
--**********************************
function x120001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_CMS_B_001}")
	
	-- �������������ˡ�������裬��
  if IsMissionHaveDone(sceneId,selfId,31) > 0 then
		AddNumText(sceneId,x120001_g_scriptId,"��굴�����",10,123);
	end
	
	for i, eventId in x120001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x120001_OnDefaultEvent( sceneId, selfId,targetId )
	x120001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x120001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 123   then
		-- ��������
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 3  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 3)
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		end
		-- �ر�UI
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
		
	end

	for i, findId in x120001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x120001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x120001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			x120001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x120001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x120001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x120001_OnDie( sceneId, selfId, killerId )
end
