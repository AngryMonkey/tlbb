--����NPC		��ֲnpc   1��ֲ����   2��ֲ����˵��
--����
--��ͨ

--�ű���
x002056_g_ScriptId = 002056

--��ӵ�е��¼�Id�б�
--estudy_zhongzhi = 713511
--elevelup_zhongzhi = 713570
--edialog_zhongzhi = 713610
x002056_g_eventList={713511,713570,713610}
--**********************************
--�¼��б�
--**********************************
function x002056_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0032}")
	for i, eventId in x002056_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002056_OnDefaultEvent( sceneId, selfId,targetId )
	x002056_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002056_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002056_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002056_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002056_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002056_g_eventList do
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
function x002056_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002056_g_eventList do
		if missionScriptId == findId then
			x002056_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002056_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002056_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002056_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002056_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002056_OnDie( sceneId, selfId, killerId )
end
