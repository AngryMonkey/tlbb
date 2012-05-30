--ؤ��NPC
--��ӡ
--��ͨ

--�ű���
x010002_g_scriptId = 010002

--��ӵ�е��¼�ID�б�
x010002_g_eventList={221901}

--**********************************
--�¼��б�
--**********************************
function x010002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  ��ؤ��ľƽ��У��þ����Ƕడ��"..PlayerName.."���㲻��ȥ������#r  �����˼�����У������棬����������ؤ���ž��ô�οƽ����")
		for i, findId in x010002_g_eventList do
			CallScriptFunction( x010002_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x010002_OnDefaultEvent( sceneId, selfId,targetId )
	x010002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x010002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x010002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x010002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			x010002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x010002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x010002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x010002_OnDie( sceneId, selfId, killerId )
end

