-- 402249
-- ������


--�ű���
x402249_g_scriptId = 402249

--��ӵ�е��¼�ID�б�
x402249_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x402249_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nStep = LuaFnGetCopySceneData_Param(sceneId, 8)
		AddText(sceneId, "#{dazhan_yzw_007}")
		if GetName(sceneId, targetId) == "������" then
			if nStep == 15  then
				AddNumText( sceneId, x402249_g_scriptId, "�ӵص�����������", 9 ,1  )
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402249_OnDefaultEvent( sceneId, selfId,targetId )
	x402249_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402249_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1  then
		--local nStep = LuaFnGetCopySceneData_Param(sceneId, 8)
		--if nStep == 14  then
			-- ������ҵ�һ���µ�λ��
			SetPos(sceneId, selfId, 154, 96)
		--end
		return
	end
	
	for i, findId in x402249_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402249_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402249_g_eventList do
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
function x402249_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402249_g_eventList do
		if missionScriptId == findId then
			x402249_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402249_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402249_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402249_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402249_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402249_OnDie( sceneId, selfId, killerId )

end

