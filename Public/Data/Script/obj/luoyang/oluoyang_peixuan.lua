--����NPC    ѧϰ��Ƕ����    ������Ƕ����
--����
--��Ƕ

--�ű���
x000114_g_ScriptId = 000114

--��ӵ�е��¼�
--estudy_xiangqian = 713504
--elevelup_xiangqian = 713563
--edialog_xiangqian = 713603
--��ӵ�е��¼�ID�б�
x000114_g_eventList={} -- 713504,713563,713603}
--**********************************
--�¼��б�
--**********************************
function x000114_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_luoyang_0031}")
	for i, eventId in x000114_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000114_OnDefaultEvent( sceneId, selfId,targetId )
	x000114_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000114_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000114_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000114_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000114_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000114_g_eventList do
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
function x000114_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000114_g_eventList do
		if missionScriptId == findId then
			x000114_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000114_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000114_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000114_OnDie( sceneId, selfId, killerId )
end
