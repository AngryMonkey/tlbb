--�ʱ���

--�ű���
x025002_g_scriptId = 025002

--��ӵ�е��¼�ID�б�
x025002_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x025002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  �����ǲ�ɽ�Ĺ���ͤ��ǰ����Ƕ�����ÿ����ҹ��������ͣˮ���������ɫ������棬��������ǹ⣬��������������#r  �����ɽ������ѩ�£�����ɽ���Ͽ��Կ������ɽ���ѩ�������ع���װ����������ҫ�£���׾�Ө��#r  ������ô�����ľ�ɫ�����Ѿ�û���˸��������ˡ���");
	for i, eventId in x025002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x025002_OnDefaultEvent( sceneId, selfId,targetId )
	x025002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x025002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x025002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x025002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025002_g_eventList do
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
function x025002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			x025002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x025002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x025002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x025002_OnDie( sceneId, selfId, killerId )
end
