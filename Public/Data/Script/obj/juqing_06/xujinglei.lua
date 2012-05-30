--036003 
--�쾪��

--�ű���
x036003_g_scriptId = 036003

--��ӵ�е��¼�ID�б�
x036003_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x036003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_JXZ_B_003}")
		AddNumText(sceneId, x036003_g_scriptId,"����ȥ����",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x036003_OnDefaultEvent( sceneId, selfId,targetId )
	x036003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x036003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 209, 200)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x036003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x036003_g_eventList do
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
function x036003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x036003_g_eventList do
		if missionScriptId == findId then
			x036003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x036003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x036003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x036003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x036003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x036003_OnDie( sceneId, selfId, killerId )
end
