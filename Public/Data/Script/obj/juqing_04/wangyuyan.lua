--������

--�ű���
x037002_g_ScriptId = 037002

--��ӵ�е��¼�ID�б�
x037002_g_eventList={200015, 200016, 200085}

--**********************************
--�¼��б�
--**********************************
function x037002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YZW_B_002}")
	for i, eventId in x037002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	--�������Ѿ������ ָ��Ⱥ��Ϸ 14����ô��һ��ѡ��
	if IsMissionHaveDone( sceneId, selfId, 14 ) > 0 then  --���������������
		if LuaFnGetCopySceneData_Param(sceneId, 10) == 0  then
			AddNumText( sceneId, x037002_g_ScriptId, "ָ��Ⱥ��Ϸ", 10, 999 )
		end
	end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x037002_OnDefaultEvent( sceneId, selfId,targetId )
	x037002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x037002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 999  then
		--��ʼ����
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		LuaFnSetCopySceneData_Param(sceneId, 11, GetGameTime(sceneId, selfId))
		LuaFnSetCopySceneData_Param(sceneId, 12, GetGameTime(sceneId, selfId))
		
		--����һ����ʼ���Ͳ�������һ����
		LuaFnSetCopySceneData_Param(sceneId, 25, 1)
		
		--�رտͻ��˽���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)

		return
	end
	
	for i, findId in x037002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x037002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId,targetId  )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x037002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			x037002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x037002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x037002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x037002_OnDie( sceneId, selfId, killerId )
end
