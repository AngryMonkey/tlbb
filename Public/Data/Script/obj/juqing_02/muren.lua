--��ٹ�ľ������

--�ű���
x118001_g_scriptId = 118001

--��ӵ�е��¼�ID�б�
x118001_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x118001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_B_002}")
		AddNumText(sceneId, x118001_g_scriptId,"���ҽ�ȥ",9,0);
		AddNumText(sceneId, x118001_g_scriptId,"����ȥ����",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x118001_OnDefaultEvent( sceneId, selfId,targetId )
	x118001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x118001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,104,77)
	elseif GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,74,53)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x118001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118001_g_eventList do
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
function x118001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			x118001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x118001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x118001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x118001_OnDie( sceneId, selfId, killerId )
end
