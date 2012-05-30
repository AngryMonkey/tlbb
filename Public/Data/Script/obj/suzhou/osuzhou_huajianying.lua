-- ����NPC
-- ������
-- һ��

-- �ű���
x001029_g_ScriptId = 001029

--��ӵ�е��¼�ID�б�
x001029_g_EventList = { 050101, 500610 }

--**********************************
--�¼��б�
--**********************************
function x001029_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    ���ھֳ��ɺڰ��������ֵ�����������ʱ��δ�����©���������ھֱ��ڣ���;��ܷ��ĺ��ˡ�" )

		local i, findId
		for i, findId in x001029_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
		
		AddNumText( sceneId, x001029_g_ScriptId, "������������", 11, 105 )
		AddNumText( sceneId, x001029_g_ScriptId, "¥��������������", 11, 106 )
		
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x001029_OnDefaultEvent( sceneId, selfId, targetId )
	x001029_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001029_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 105 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_077}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return	
	elseif GetNumText() == 106 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSHBZ_80917_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end


	local i, findId
	for i, findId in x001029_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001029_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001029_g_EventList do
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
function x001029_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			x001029_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001029_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001029_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001029_OnDie( sceneId, selfId, killerId )
end
