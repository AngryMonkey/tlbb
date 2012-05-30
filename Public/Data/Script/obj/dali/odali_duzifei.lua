--����NPC		���   1��⿼���ѧϰ 2��⿼���˵��
--���ӷ�
--��ͨ

--�ű���
x002061_g_ScriptId = 002061

--��ӵ�е��¼�Id�б�
--elevelup_pengren = 713561
--edialog_pengren = 713601
--��ӵ�е��¼�ID�б�
x002061_g_eventList={713561,713601}	
--**********************************
--�¼��б�
--**********************************
function x002061_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0035}")
	AddNumText(sceneId,x002061_g_ScriptId,"��������ͷ��",11,0)
	for i, eventId in x002061_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002061_OnDefaultEvent( sceneId, selfId,targetId )
	x002061_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002061_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0036}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	for i, findId in x002061_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002061_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002061_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002061_g_eventList do
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
function x002061_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002061_g_eventList do
		if missionScriptId == findId then
			x002061_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002061_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002061_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002061_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002061_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002061_OnDie( sceneId, selfId, killerId )
end
