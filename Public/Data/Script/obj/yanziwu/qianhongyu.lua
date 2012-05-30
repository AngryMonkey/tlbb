--402246
-- Ǯ����

--�ű���
x402246_g_scriptId = 402246

x402246_g_SceneData_1 = 8

--��ӵ�е��¼�ID�б�
x402246_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x402246_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nStep = LuaFnGetCopySceneData_Param(sceneId, 8)
		if nStep==11   then
			AddText(sceneId, "#{dazhan_yzw_004}")
		elseif nStep == 15  then
			AddText(sceneId, "#{dazhan_yzw_006}")
		else
			AddText(sceneId, "#{dazhan_yzw_005}")
		end

		for i, eventId in x402246_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		if nStep == 10  then
			AddNumText( sceneId, x402246_g_scriptId, "ս���ɣ�", 10 ,1  )
		end
			
		if nStep < 14  then
			--AddNumText( sceneId, x402246_g_scriptId, "ֱ�ӿ�ʼ��3��", 10 ,2  )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402246_OnDefaultEvent( sceneId, selfId,targetId )
	x402246_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402246_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 1  then
		-- ��⵱ǰ�ǲ�������ظ������������Ҫ����ȫ��飬�����Ȳ���
		if GetName(sceneId, targetId) ~= "Ǯ����"  then
			return
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 10  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 11)
		end
		
		-- �رս���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 2  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 15)
		
		--ͬʱˢ����Ҫ�ĺ�����
		CallScriptFunction( 401040, "CreateMonster_9",sceneId )
		CallScriptFunction( 401040, "CreateMonster_10",sceneId )
		CallScriptFunction( 401040, "CreateMonster_11",sceneId )
		
		BeginEvent(sceneId)
			AddText(sceneId, "  ��3���Ѿ�����")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end

	for i, findId in x402246_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402246_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
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
function x402246_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			x402246_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402246_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402246_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402246_OnDie( sceneId, selfId, killerId )
	LuaFnSetCopySceneData_Param(sceneId, 26, 501)
end

