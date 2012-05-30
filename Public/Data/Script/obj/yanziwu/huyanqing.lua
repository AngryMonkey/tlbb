-- 402240
-- ������  �����븱����

--�ű���
x402240_g_scriptId = 402240

--��ӵ�е��¼�ID�б�
x402240_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x402240_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "#{dazhan_yzw_001}")		    				
		for i, eventId in x402240_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		-- ���һ���˳�������ѡ��
		--AddNumText( sceneId, x402240_g_scriptId, "ǰ��̫��", 9 ,1  )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402240_OnDefaultEvent( sceneId, selfId,targetId )
	x402240_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402240_OnEventRequest( sceneId, selfId, targetId, eventId )
	
--	if GetNumText() == 1   then
--		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 4,70,121)
--		return
--	end

	for i, findId in x402240_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402240_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402240_g_eventList do
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
function x402240_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			x402240_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402240_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402240_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402240_OnDie( sceneId, selfId, killerId )

end

