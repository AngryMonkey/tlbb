--����NPC
--��˹
--��ͨ

--�ű���
x002090_g_scriptId	= 002090

--��ӵ�е��¼�ID�б�
x002090_g_eventList	= { 808005 }

--**********************************
--�¼��б�
--**********************************
function x002090_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ���Ǵ�ңԶ��ӡ�ȶ������ǳ���Ľ�쳯�Ϲ�����ʳ�Ļ���������Ҳ�ڷ����ɹ�һЩ���ޱ����������ǵĹ��ҡ�" )
		for i, eventId in x002090_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId,selfId,targetId )
end

--**********************************
--�¼��������
--**********************************
function x002090_OnDefaultEvent( sceneId, selfId, targetId )
	x002090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002090_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002090_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002090_g_eventList do
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
function x002090_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			x002090_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002090_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002090_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--����ύ����Ʒ������
--**********************************
function x002090_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if scriptId ~= nil then
		CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	end
end

--**********************************
--�����¼�
--**********************************
function x002090_OnDie( sceneId, selfId, killerId )
end
