--̫��NPC
--�췴����
--��ͨ

--�ű���
x050012_g_ScriptId	= 050012

--��ӵ�е��¼�ID�б�
x050012_g_EventList	= { 050013 }
--��ȡ�������͵ȼ�
x050012_g_minLevel			= 20

--**********************************
--�¼��б�
--**********************************
function x050012_UpdateEventList( sceneId, selfId, targetId )

		CallScriptFunction( x050012_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x050012_OnDefaultEvent( sceneId, selfId, targetId )
	x050012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x050012_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x050012_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x050012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x050012_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--�ܾ���NPC������
--**********************************
function x050012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x050012_g_EventList do
		if missionScriptId == findId then
			x050012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�������Ѿ���������
--**********************************
function x050012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x050012_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�ύ�����������
--**********************************
function x050012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x050012_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--�����¼�
--**********************************
function x050012_OnDie( sceneId, selfId, killerId )
end
