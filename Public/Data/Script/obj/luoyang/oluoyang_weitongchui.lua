--����NPC  �ɿ�npc  ѧϰ�ɿ���  �����ɿ���
--Ѧͭ��
--��ͨ

--�ű���
x000061_g_ScriptId = 000061

--�̵���
x000061_g_shoptableindex=73

--��ӵ�е��¼�
--estudy_caikuang = 713508
--elevelup_caikuang = 713567
--edialog_caikuang = 713607
--��ӵ�е��¼�ID�б�
x000061_g_eventList={713508,713567}--,713607}
--**********************************
--�¼��б�
--**********************************
function x000061_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_luoyang_0018}")
	for i, eventId in x000061_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x000061_g_ScriptId,"���򹤾�",7,ABILITY_TEACHER_SHOP)
	AddNumText( sceneId, x000061_g_ScriptId, "�ɿ����", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000061_OnDefaultEvent( sceneId, selfId,targetId )
	x000061_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000061_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_005}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000061_g_shoptableindex )
	end
	for i, findId in x000061_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000061_g_ScriptId )
		return
		end
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x000061_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000061_g_eventList do
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
function x000061_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000061_g_eventList do
		if missionScriptId == findId then
			x000061_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000061_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000061_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000061_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000061_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000061_OnDie( sceneId, selfId, killerId )
end
