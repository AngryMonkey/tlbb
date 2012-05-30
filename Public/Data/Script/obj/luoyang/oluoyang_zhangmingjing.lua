--����NPC		��ҩnpc		1ѧϰ��ҩ����		2��ҽ����˵��
--������
--��ͨ

--�ű���
x000108_g_ScriptId = 000108

--��ӵ�е��¼�Id�б�
--estudy_zhiyao = 713503
--elevelup_zhiyao = 713562
--edialog_zhiyao = 713602
--��ӵ�е��¼�ID�б�
x000108_g_eventList={713503,713562,250502}--,713602
--**********************************
--�¼��б�
--**********************************
function x000108_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ҫ��ѧϰ�������ҩ�ļ��ܾ;����������￴������Ҫ�ڽ�����������ȥ��һЩ�ر���ҩ�Ǳز����ٵġ�")
		AddText(sceneId,"  ���ѧϰ��ҩ������ܹ��Լ���ЩӦ����ҩƷ�ˣ�����Щ���ԣ�����Է��ָ������Ƶ�ҩ�ķ�����")
		for i, eventId in x000108_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x000108_g_ScriptId, "��ҩ����", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000108_OnDefaultEvent( sceneId, selfId,targetId )
	x000108_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000108_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_007}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000108_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000108_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000108_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000108_g_eventList do
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
function x000108_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000108_g_eventList do
		if missionScriptId == findId then
			x000108_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000108_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000108_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000108_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000108_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000108_OnDie( sceneId, selfId, killerId )
end
