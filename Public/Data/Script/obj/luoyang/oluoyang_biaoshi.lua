--����NPC
--��ʦ
--��ͨ
--��ӵ�е��¼�ID�б�

--�ű���
x000073_g_scriptId = 000073

x000073_g_eventList={889051}
--**********************************
--�¼��������
--**********************************
function x000073_OnDefaultEvent( sceneId, selfId,targetId )
	x000073_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�
--**********************************
function x000073_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{NSRQ_JS_01}")
		for i, eventId in x000073_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000073_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x000073_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000073_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000073_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--�������Ѿ���������
--**********************************
function x000073_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--�ύ�����������
--**********************************
function x000073_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

