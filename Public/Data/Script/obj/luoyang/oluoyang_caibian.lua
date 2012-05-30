--�̱�

--�ű���
x000002_g_scriptId = 000002

--��ӵ�е��¼�ID�б�
x000002_g_eventList={200501,200502,200603,200604,201111,201211,201313,201411,201412,201511,201512,201611,650000}

--**********************************
--�¼��б�
--**********************************
function x000002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  ���������������µ�һ��ǡ������������ɱ�����ȥ��������ĵ����ȥ��������һ���㡣");
	--bDone = IsMissionHaveDone( sceneId, selfId, 0004 );
	--PrintStr (bDone)
	for i, eventId in x000002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000002_OnDefaultEvent( sceneId, selfId,targetId )
	x000002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000002_g_eventList do
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
function x000002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000002_g_eventList do
		if missionScriptId == findId then
			x000002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000002_OnDie( sceneId, selfId, killerId )
end
