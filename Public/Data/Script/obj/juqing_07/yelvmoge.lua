-- ��ãɽ 121005

--�ű���
x121005_g_scriptId = 121005

--��ӵ�е��¼�ID�б�
x121005_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x121005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_CMS_Y_004}")
		AddNumText(sceneId, x121005_g_scriptId,"����ȥ����",9,1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x121005_OnDefaultEvent( sceneId, selfId,targetId )
	x121005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x121005_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 18, 128, 51)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x121005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121005_g_eventList do
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
function x121005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x121005_g_eventList do
		if missionScriptId == findId then
			x121005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x121005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x121005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x121005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x121005_OnDie( sceneId, selfId, killerId )
end
