--����NPC		���   1��⿼���ѧϰ 2��⿼���˵��
--�����
--��ͨ

--�ű���
x000107_g_ScriptId = 000107

--��ӵ�е��¼�Id�б�
--elevelup_pengren = 713561
--edialog_pengren = 713601
--��ӵ�е��¼�ID�б�
x000107_g_eventList={713561,250505}--,713601
--**********************************
--�¼��б�
--**********************************
function x000107_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Ҫ��ѧϰ�������⿵ļ��ܾ;����������￴����ֻ�в��ϵ���ϰ�������⿼��������Ȳ�������ˡ�")
	AddText(sceneId,"  ���������⿼��ܣ�����ܹ�ѧϰ�����߼������⿼����ˡ�")
	for i, eventId in x000107_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x000107_g_ScriptId, "��⿽���", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000107_OnDefaultEvent( sceneId, selfId,targetId )
	x000107_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000107_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000107_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000107_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000107_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000107_g_eventList do
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
function x000107_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			x000107_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000107_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000107_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000107_OnDie( sceneId, selfId, killerId )
end
