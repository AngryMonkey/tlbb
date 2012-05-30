--����

--�ű���
x029001_g_scriptId = 029001

--��ӵ�е��¼�ID�б�
x029001_g_eventList={212115}--212000,212002,212003,212004,212005,212006,212007,212008,212009	

--**********************************
--�¼��б�
--**********************************
function x029001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"����ʲô������?")
	for i, eventId in x029001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x029001_OnDefaultEvent( sceneId, selfId,targetId )
	x029001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x029001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x029001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x029001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x029001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId ,targetId)
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x029001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x029001_g_eventList do
		if missionScriptId == findId then
			x029001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x029001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x029001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x029001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x029001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x029001_OnDie( sceneId, selfId, killerId )
end
