--��ңNPC  ѧϰ���Ŷݼ׼���
--�밢��
--��ͨ

--�ű���
x014005_g_ScriptId = 014005

--��ӵ�е��¼�
--estudy_qimendunjia = 713520
--elevelup_qimendunjia = 713579
--edialog_qimendunjia = 713619

--��ӵ�е��¼�ID�б�
x014005_g_eventList={713520,713579,701611,225901}	

--**********************************
--�¼��б�
--**********************************
function x014005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_xiaoyao_0002}")
	for i, eventId in x014005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x014005_g_ScriptId, "���Ŷݼ׽���", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x014005_OnDefaultEvent( sceneId, selfId,targetId )
	x014005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014005_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_037}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x014005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x014005_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x014005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014005_g_eventList do
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
function x014005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x014005_g_eventList do
		if missionScriptId == findId then
			x014005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x014005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x014005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x014005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x014005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x014005_OnDie( sceneId, selfId, killerId )
end
