--��ս����NPC B��
--ͯ��
--��ͨ

--�ű���
x402290_g_scriptId = 402290

--��ӵ�е��¼�ID�б�
x402290_g_eventList={600051}

--**********************************
--�¼��б�
--**********************************
function x402290_UpdateEventList( sceneId, selfId, targetId )
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_27}")
			--AddNumText(sceneId,x402290_g_scriptId,"����",6,0)
		EndEvent(sceneId)
		for i, eventId in x402290_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--�¼��������
--**********************************
function x402290_OnDefaultEvent( sceneId, selfId,targetId )
	x402290_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402290_OnEventRequest( sceneId, selfId, targetId, eventId )

	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 0 then
		return
	end

	local	key	= GetNumText()

	for i, findId in x402290_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()��addnumtext�����ı���
			return
		end
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x402290_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402290_g_eventList do
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
function x402290_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402290_g_eventList do
		if missionScriptId == findId then
			x402290_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402290_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402290_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402290_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402290_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end