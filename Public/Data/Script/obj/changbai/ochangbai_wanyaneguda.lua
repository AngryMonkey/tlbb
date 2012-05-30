--���հ��Ǵ�

--�ű���
x022001_g_scriptId = 022001

--��ӵ�е��¼�ID�б�
x022001_g_eventList={}--211305,211306,211309	

--**********************************
--�¼��б�
--**********************************
function x022001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  �ɹ��˶���˵��Ů���������һ����һ���������޵С����ղ�һ��ҪͳһŮ�棬����һ������Ʒ��ɹ���ͳ�Ρ�")
	for i, eventId in x022001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022001_OnDefaultEvent( sceneId, selfId,targetId )
	x022001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x022001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x022001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022001_g_eventList do
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
function x022001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			x022001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x022001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x022001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022001_OnDie( sceneId, selfId, killerId )
end
