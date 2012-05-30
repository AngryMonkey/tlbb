--����ճû��

--�ű���
x022004_g_scriptId = 022004

--��ӵ�е��¼�ID�б�
x022004_g_eventList={212110}--211304	

--**********************************
--�¼��б�
--**********************************
function x022004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  أ����С�ӣ���Ȼ�����ô��Ҫ�Ķ���Ū��������ǰһֱ��Ϊ���ܴ����أ���������Ҳ��డ��")
	for i, eventId in x022004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022004_OnDefaultEvent( sceneId, selfId,targetId )
	x022004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x022004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x022004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x022004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			x022004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x022004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x022004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022004_OnDie( sceneId, selfId, killerId )
end
