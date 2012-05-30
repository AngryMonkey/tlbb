--����NPC		���   1��⿼���ѧϰ 2��⿼���˵��
--�ǻ�
--��ͨ

--�ű���
x001030_g_ScriptId = 001030

--��ӵ�е��¼�Id�б�
--elevelup_pengren = 713561
--edialog_pengren = 713601
--��ӵ�е��¼�ID�б�
x001030_g_eventList={713561,713601}
--**********************************
--�¼��б�
--**********************************
function x001030_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0010}")
	for i, eventId in x001030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001030_OnDefaultEvent( sceneId, selfId,targetId )
	x001030_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001030_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001030_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001030_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001030_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,ABILITY_PENGREN )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x001030_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			x001030_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001030_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001030_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001030_OnDie( sceneId, selfId, killerId )
end
