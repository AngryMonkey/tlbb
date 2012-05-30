-- ¥��NPC
-- ����
-- ��ͨ

-- �ű���
x050111_g_ScriptId = 050111

--��ӵ�е��¼�ID�б�
x050111_g_EventList = { 050221 }

x050111_g_Name					= "����"

--**********************************
--�¼��б�
--**********************************
function x050111_UpdateEventList( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x050111_g_Name then
		return
	end
	
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_20}" )
		--local i, findId
		for i, findId in x050111_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x050111_g_ScriptId, "����������", 11, 10 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x050111_OnDefaultEvent( sceneId, selfId, targetId )
	x050111_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x050111_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80822_2}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--local i, findId
	for i, findId in x050111_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x050111_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	--local i, findId
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x050111_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			x050111_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x050111_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x050111_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x050111_OnDie( sceneId, selfId, killerId )
end
