--��ɽNPC
--������
--��ͨ

--��ӵ�е��¼�ID�б�
x017008_g_eventList={229006,228000,228001,228002,228003,228004,228005,228006,228007,228008,228009,228010,228011,228012,228020,228900,050061}
--**********************************
--�¼��������
--**********************************
function x017008_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���Ƿ����ǣ��ҷ�����ɽ��ʦ������")
		CallScriptFunction( x017008_g_eventList[1], "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 228900, "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 229011, "OnEnumerate",sceneId, selfId, targetId, MP_TIANSHAN )
		CallScriptFunction( 050025, "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 050061, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x017008_OnDefaultEvent( sceneId, selfId,targetId )
	x017008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x017008_OnEventRequest( sceneId, selfId, targetId, eventId )

	if eventId == 229011 then
		CallScriptFunction( 229011, "OnDefaultEvent",sceneId, selfId, targetId, MP_TIANSHAN, GetNumText() )
		return
	elseif eventId == 050025 then
    CallScriptFunction( 050025, "OnDefaultEvent",sceneId, selfId, targetId, MP_TIANSHAN)
		return
	elseif eventId == 050061 then
		CallScriptFunction( 050061, "OnDefaultEvent",sceneId, selfId, targetId,MP_TIANSHAN)
		return
	end

	for i, findId in x017008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x017008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017008_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId)
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x017008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x017008_g_eventList do
		if missionScriptId == findId then
			x017008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x017008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x017008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x017008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x017008_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x017008_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	for i, findId in x017008_g_eventList do
		if scriptId == findId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
			return
		end
	end
end
