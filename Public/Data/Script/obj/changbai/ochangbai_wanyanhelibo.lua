--����ӯ��

--�ű���
x022008_g_scriptId = 022008

--��ӵ�е��¼�ID�б�
x022008_g_eventList={}--211300,211306	

--**********************************
--�¼��б�
--**********************************
function x022008_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  ��ʹ���ˣ����ղ��������Ƥ�Ӷ�����õģ�����ʯ�Ҳ���ĺö��ˡ�������Щ�ϵȻ����Ǹ���ʹ���˵ģ������ڴ�����ǰ������ԣ�˵���ղ�����Զ���ɹ����ҳϵ�������")
	for i, eventId in x022008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022008_OnDefaultEvent( sceneId, selfId,targetId )
	x022008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x022008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x022008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022008_g_eventList do
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
function x022008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			x022008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x022008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x022008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022008_OnDie( sceneId, selfId, killerId )
end
