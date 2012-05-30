--����NPC
--����
--��ͨ

--��ӵ�е��¼�ID�б�
x016010_g_eventList={229007,227000,227001,227002,227003,227004,227005,227006,227007,227008,227009,227010,227011,227012,227020,227900,050061}
--**********************************
--�¼��������
--**********************************
function x016010_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������壬�ҷ���������ʦ������")
		CallScriptFunction( x016010_g_eventList[1], "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 227900, "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 229011, "OnEnumerate",sceneId, selfId, targetId, MP_XINGSU )
		CallScriptFunction( 050025, "OnEnumerate",sceneId, selfId, targetId )
		CallScriptFunction( 050061, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x016010_OnDefaultEvent( sceneId, selfId,targetId )
	x016010_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x016010_OnEventRequest( sceneId, selfId, targetId, eventId )

	if eventId == 229011 then
		CallScriptFunction( 229011, "OnDefaultEvent",sceneId, selfId, targetId, MP_XINGSU, GetNumText() )
		return
	elseif eventId == 050025 then
    CallScriptFunction( 050025, "OnDefaultEvent",sceneId, selfId, targetId, MP_XINGSU)
		return
	elseif eventId == 050061 then
		CallScriptFunction( 050061, "OnDefaultEvent",sceneId, selfId, targetId,MP_XINGSU)
		return
	end

	for i, findId in x016010_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x016010_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016010_g_eventList do
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
function x016010_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x016010_g_eventList do
		if missionScriptId == findId then
			x016010_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x016010_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016010_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x016010_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x016010_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x016010_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x016010_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	for i, findId in x016010_g_eventList do
		if scriptId == findId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
			return
		end
	end
end
