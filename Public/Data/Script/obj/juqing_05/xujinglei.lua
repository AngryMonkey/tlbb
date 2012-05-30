--�쾪��

--�ű���
x113002_g_scriptId = 113002

--��ӵ�е��¼�ID�б�
x113002_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x113002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_JXZ_Y_002}")
		AddNumText(sceneId, x113002_g_scriptId,"����ȥ����",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x113002_OnDefaultEvent( sceneId, selfId,targetId )
	x113002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x113002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 209, 200)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x113002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x113002_g_eventList do
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
function x113002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x113002_g_eventList do
		if missionScriptId == findId then
			x113002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x113002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x113002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x113002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x113002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x113002_OnDie( sceneId, selfId, killerId )
end
