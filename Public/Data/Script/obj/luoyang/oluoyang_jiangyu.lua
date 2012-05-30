--����NPC		����npc		1�������㼼��		2���㼼��˵��
--����
--��ͨ

--�ű���
x000060_g_ScriptId = 000060

--�̵���
x000060_g_shoptableindex=73

--��ӵ�е��¼�Id�б�
--estudy_diaoyu = 713510
--elevelup_diaoyu = 713569
--edialog_diaoyu = 713609
--��ӵ�е��¼�ID�б�
x000060_g_eventList={713510,713569,713609}
--**********************************
--�¼��б�
--**********************************
function x000060_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_luoyang_0017}")
	for i, eventId in x000060_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x000060_g_ScriptId,"���򹤾�",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000060_OnDefaultEvent( sceneId, selfId,targetId )
	x000060_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000060_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000060_g_shoptableindex )
	end
	for i, findId in x000060_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000060_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000060_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000060_g_eventList do
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
function x000060_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000060_g_eventList do
		if missionScriptId == findId then
			x000060_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000060_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000060_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000060_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000060_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000060_OnDie( sceneId, selfId, killerId )
end
