--�Ϲ�

--�ű���
x114004_g_scriptId = 114004

--��ӵ�е��¼�ID�б�
x114004_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x114004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{JQ_YZW_Y_004}")
		AddNumText(sceneId, x114004_g_scriptId,"����ȥ����",9,1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x114004_OnDefaultEvent( sceneId, selfId,targetId )
	x114004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x114004_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1, 83, 268)
	end
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x114004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x114004_g_eventList do
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
function x114004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x114004_g_eventList do
		if missionScriptId == findId then
			x114004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x114004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x114004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x114004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x114004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x114004_OnDie( sceneId, selfId, killerId )
end
