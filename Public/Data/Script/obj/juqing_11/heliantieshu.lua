--115005

-- �������� 115005

--�ű���
x115005_g_scriptId = 115005

--��ӵ�е��¼�ID�б�
x115005_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x115005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_YPT_Y_005}")
	AddNumText(sceneId, x115005_g_scriptId,"�뿪����",9,999);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x115005_OnDefaultEvent( sceneId, selfId,targetId )
	x115005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x115005_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==999	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,115,66)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x115005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x115005_g_eventList do
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
function x115005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x115005_g_eventList do
		if missionScriptId == findId then
			x115005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x115005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x115005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x115005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x115005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x115005_OnDie( sceneId, selfId, killerId )
end
