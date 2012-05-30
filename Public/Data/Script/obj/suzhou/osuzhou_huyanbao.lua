--����NPC
--���ӱ�
--��ͨ

--�ű���
x001061_g_ScriptId	= 001061

--��ӵ�е��¼�ID�б�
x001061_g_EventList	= { 232000, 232001, 500618 }

--ȱʡ�Ի�
x001061_g_dlg	= "  ���²����ˣ�����ˮկ��ˮ������ķ��˱�����ʿ���󲿷ֶ�����ѵ��ȥ�ˣ�����ˮկ���ֲ��㣬�����Ҫ�����ݵ�֪������أ���ô����Ը������ǵ�æȥˮկƽ������������"

--**********************************
--�¼��б�
--**********************************
function x001061_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x001061_g_dlg )

		for i, findId in x001061_g_EventList do
			if findId == 232000 or findId == 500618 then
				CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end

		AddNumText( sceneId, x001061_g_ScriptId, "ˮ���������", 11, 10 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--�¼��������
--**********************************
function x001061_OnDefaultEvent( sceneId, selfId, targetId )

	x001061_UpdateEventList( sceneId, selfId, targetId )

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001061_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_074}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x001061_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
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
function x001061_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	local i				= 1
	local findId	= 0
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			x001061_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�������Ѿ���������
--**********************************
function x001061_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�ύ�����������
--**********************************
function x001061_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	local i				= 1
	local findId	= 0
	for i, findId in x001061_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--�����¼�
--**********************************
function x001061_OnDie( sceneId, selfId, killerId )
end
