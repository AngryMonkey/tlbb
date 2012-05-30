-- ���ӹ���NPC
-- ���� 
-- ���������ͽű�

--�ű���
x001173_g_scriptId = 001173

--��ӵ�е��¼�ID�б�
x001173_g_eventList={125020}
x001173_g_MsgInfo = { "#{SHGZ_0612_02}",
											"#{SHGZ_0620_04}",
											"#{SHGZ_0620_05}",
											"#{SHGZ_0620_06}",
										}

--**********************************
--�¼��б�
--**********************************
function x001173_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001173_g_MsgInfo))
		AddText( sceneId, x001173_g_MsgInfo[msgidx] )	
		for i, eventId in x001173_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001173_OnDefaultEvent( sceneId, selfId,targetId )
	x001173_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001173_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001173_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001173_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001173_g_eventList do
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
function x001173_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001173_g_eventList do
		if missionScriptId == findId then
			x001173_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001173_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001173_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001173_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001173_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001173_OnDie( sceneId, selfId, killerId )
	
end
