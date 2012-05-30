--����NPC ��ҩ����NPC   �������ܣ�1��ҩ���ܵ�ѧϰ 2�����ҩ����
--����ū
--��ͨ

--�ű���
x002049_g_ScriptId = 002049

--�̵���
x002049_g_shoptableindex=73

--��ӵ�е��¼�Id�б�
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--��ӵ�е��¼�ID�б�
x002049_g_eventList={713509,713568,713608}
--**********************************
--�¼��б�
--**********************************
function x002049_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0027}")
	for i, eventId in x002049_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x002049_g_ScriptId,"���򹤾�",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002049_OnDefaultEvent( sceneId, selfId,targetId )
	x002049_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002049_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x002049_g_shoptableindex )
	end
	for i, findId in x002049_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002049_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002049_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002049_g_eventList do
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
function x002049_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002049_g_eventList do
		if missionScriptId == findId then
			x002049_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002049_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002049_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002049_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002049_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002049_OnDie( sceneId, selfId, killerId )
end
