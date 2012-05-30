--����NPC     ����ѭ������
--����
--��ͨ

--�ű���
x000068_g_scriptId = 000068

--��ӵ�е��¼�ID�б�
x000068_g_eventList={230000, 230011, 230012}

--**********************************
--�¼��б�
--**********************************
function x000068_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		local PlayerName = GetName( sceneId, selfId )
		AddText(sceneId, "  "..PlayerName.."#{OBJ_luoyang_0021}")
		--for i, eventId in x000068_g_eventList do
		CallScriptFunction( x000068_g_eventList[1], "OnEnumerate", sceneId, selfId, targetId )
		--end
	EndEvent(sceneId)
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x000068_OnDefaultEvent( sceneId, selfId, targetId )
------------------------------------------------------
--[Nov.1 2006]Lybin Close
--x000068_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local PlayerName	= GetName( sceneId, selfId )
		AddText( sceneId, "  "..PlayerName.."#{OBJ_luoyang_0021}" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
------------------------------------------------------
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000068_OnEventRequest( sceneId, selfId, targetId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000068_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
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
function x000068_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i = 1
	local findId = 0

	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			x000068_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000068_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000068_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000068_OnDie( sceneId, selfId, killerId )
end
