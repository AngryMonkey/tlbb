--��ңNPC
--�ع�
--��ͨ

--��ӵ�е��¼�ID�б�
x014008_g_eventList={229005,225000,225001,225002,225003,225004,225005,225006,225007,225008,225009,225010,225011,225012,225020,225900,050061}
--**********************************
--�¼��������
--**********************************
function x014008_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����عۣ��ҷ�����ң��ʦ������")
		CallScriptFunction( x014008_g_eventList[1], "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 225900, "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 229011, "OnEnumerate",sceneId, selfId, targetId, MP_XIAOYAO )
		CallScriptFunction( 050025, "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 050061, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x014008_OnDefaultEvent( sceneId, selfId,targetId )
	x014008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014008_OnEventRequest( sceneId, selfId, targetId, eventId )

	if eventId == 229011 then
		CallScriptFunction( 229011, "OnDefaultEvent",sceneId, selfId, targetId, MP_XIAOYAO, GetNumText() )
		return
	elseif eventId == 050025 then
    CallScriptFunction( 050025, "OnDefaultEvent",sceneId, selfId, targetId, MP_XIAOYAO)
		return
	elseif eventId == 050061 then
		CallScriptFunction( 050061, "OnDefaultEvent",sceneId, selfId, targetId,MP_XIAOYAO)
		return
	end

	for i, findId in x014008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x014008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014008_g_eventList do
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
function x014008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x014008_g_eventList do
		if missionScriptId == findId then
			x014008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x014008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x014008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x014008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x014008_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x014008_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	for i, findId in x014008_g_eventList do
		if scriptId == findId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
			return
		end
	end
end
