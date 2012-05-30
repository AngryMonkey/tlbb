--ˮ�θ�������npc

--�ű���
x000089_g_scriptId = 000090


--��ӵ�е��¼�ID�б�
x000089_g_eventList={231000}

--**********************************
--�¼��б�
--**********************************
function x000089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." �����ɡ�\n")
		for i, findId in x000089_g_eventList do
			CallScriptFunction( x000089_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000089_OnDefaultEvent( sceneId, selfId, targetId )
------------------------------------------------------
--[Nov.1 2006]Lybin Close
--x000089_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ���ȥ�����°ɣ������ʦһ���Ȳ�������������أ����⼸�չ����������ƽ��ˮ�ε�����֮��һ��ȥ�����°��������ʦ�������" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
------------------------------------------------------
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000089_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			x000089_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000089_OnDie( sceneId, selfId, killerId )
end
