--����NPC �ɿ�npc  ѧϰ�ɿ���  �����ɿ���
--��С��
--��ͨ

--�ű���
x001039_g_ScriptId = 001039

--�̵���
x001039_g_shoptableindex=73

--��ӵ�е��¼�Id�б�
--estudy_caikuang = 713508
--elevelup_caikuang = 713567
--edialog_caikuang = 713607
--��ӵ�е��¼�ID�б�
x001039_g_eventList={713508,713567,713607}
--**********************************
--�¼��б�
--**********************************
function x001039_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0013}")
	for i, eventId in x001039_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x001039_g_ScriptId,"���򹤾�",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001039_OnDefaultEvent( sceneId, selfId,targetId )
	x001039_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001039_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001039_g_shoptableindex )
	end
	for i, findId in x001039_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001039_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001039_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001039_g_eventList do
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
function x001039_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001039_g_eventList do
		if missionScriptId == findId then
			x001039_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001039_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001039_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001039_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001039_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001039_OnDie( sceneId, selfId, killerId )
end
