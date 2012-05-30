-- ������ 117026

--�ű���
x117026_g_scriptId = 117026

--��ӵ�е��¼�ID�б�
x117026_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x117026_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_LGS_Y_025}")
	AddNumText(sceneId, x117026_g_scriptId,"�뿪����",9,999);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x117026_OnDefaultEvent( sceneId, selfId,targetId )
	x117026_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x117026_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==999	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 14,150,150)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x117026_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117026_g_eventList do
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
function x117026_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x117026_g_eventList do
		if missionScriptId == findId then
			x117026_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x117026_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117026_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x117026_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x117026_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x117026_OnDie( sceneId, selfId, killerId )
end
