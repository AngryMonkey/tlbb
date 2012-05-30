--������

--�ű���
x000005_g_ScriptId = 000005


--��ӵ�е��¼�ID�б�
x000005_g_eventList={200502,200601,200602,200603,250508}

--�԰�״̬����
x000005_g_missionId = 12

--**********************************
--�¼��б�
--**********************************
function x000005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
  if  (IsMissionHaveDone(sceneId,selfId,x000005_g_missionId) > 0 ) then
  			AddText(sceneId,"  ���������䡣��������Ϊ�ƣ������ؿ����á�");
	else			
			AddText(sceneId,"#{OBJ_luoyang_0002}");
	end
	for i, eventId in x000005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000005_OnDefaultEvent( sceneId, selfId,targetId )
	x000005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000005_g_eventList do
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
function x000005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000005_g_eventList do
		if missionScriptId == findId then
			x000005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000005_OnDie( sceneId, selfId, killerId )
end
