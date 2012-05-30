--038002

-- ���¹�Ů 038002

--�ű���
x038002_g_ScriptId = 038002

--��ӵ�е��¼�ID�б�
x038002_g_eventList={200053, 200055}

--**********************************
--�¼��б�
--**********************************
function x038002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YPT_B_003}")
	for i, eventId in x038002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	
	-- �������Ѿ���������񡰻���չ���ҹ�ꡱ��
	-- x200053_g_MissionIdΪ43
	if (IsMissionHaveDone(sceneId,selfId,43) > 0 ) then
		if LuaFnGetCopySceneData_Param(sceneId, 30) == 0 then
			AddNumText( sceneId, x038002_g_ScriptId, "�ư��ʾ�����", 10, 999 )
			--LuaFnSetCopySceneData_Param(sceneId, 30, 1)
		end
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��������
--**********************************
function x038002_OnDefaultEvent( sceneId, selfId,targetId )
	x038002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x038002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 999 then
		--��ʼ����
		LuaFnSetCopySceneData_Param(sceneId, 8, 1) --����˵��
		LuaFnSetCopySceneData_Param(sceneId, 9, GetGameTime(sceneId, selfId))	--ʱ��

		LuaFnSetCopySceneData_Param(sceneId, 30, 1)
		
    BeginEvent(sceneId)
		AddText(sceneId,"��ӭ��ĵ���!")
    EndEvent( )
    DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	for i, findId in x038002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x038002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038002_g_eventList do
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
function x038002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x038002_g_eventList do
		if missionScriptId == findId then
			x038002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x038002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x038002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x038002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x038002_OnDie( sceneId, selfId, killerId )
end
