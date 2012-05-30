--�Ӱ�ʱ

--�ű���
x001012_g_scriptId = 001012

--��ӵ�е��¼�ID�б�
x001012_g_eventList={200601,200602,200802,200803,212116,713503,713562}

--**********************************
--�¼��б�
--**********************************
function x001012_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	print(PlayerName)
	--AddText(sceneId,"  ҽ���Ծ�������Ϊ��ְ�������һ���������ز�����ô���أ��ȣ����ǲ��ȣ�����һ�����⡣");
	AddText(sceneId, "#{OBJ_dali_0034}");
	for i, eventId in x001012_g_eventList do
		print(i)
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001012_OnDefaultEvent( sceneId, selfId,targetId )
	x001012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001012_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == 713503 or eventId == 713562 then
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(), x001012_g_scriptId )
		return
	end
	for i, findId in x001012_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001012_g_eventList do
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
function x001012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001012_g_eventList do
		if missionScriptId == findId then
			x001012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001012_OnDie( sceneId, selfId, killerId )
end
