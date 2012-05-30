--����NPC ��ҩ����NPC   �������ܣ�1��ҩ���ܵ�ѧϰ 2�����ҩ����
--�ϰٲ�
--��ͨ

--�ű���
x000103_g_ScriptId = 000103

--�̵���
x000103_g_shoptableindex=73

--��ӵ�е��¼�Id�б�
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--��ӵ�е��¼�ID�б�
x000103_g_eventList={713509,713568,250501}--,713608
--**********************************
--�¼��б�
--**********************************
function x000103_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ��ѧϰ����߲�ҩ���ܾ;����������￴����Ҫ�õ�����ϡ�е�ҩ�ݣ�Ŀǰ�����ǲ��еġ�")
	AddText(sceneId,"  ��ҩ����ÿ����ҩ�˱ر�����Ʒ�������ռ����㹻��ҩ�ݣ���֪���ô�ʲô�ط�ȥ�ҵ������ˡ�")
	for i, eventId in x000103_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x000103_g_ScriptId,"���򹤾�",7,ABILITY_TEACHER_SHOP)
	AddNumText( sceneId, x000103_g_ScriptId, "��ҩ����", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000103_OnDefaultEvent( sceneId, selfId,targetId )
	x000103_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000103_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_006}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000103_g_shoptableindex )
	end
	for i, findId in x000103_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000103_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000103_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000103_g_eventList do
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
function x000103_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			x000103_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000103_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000103_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000103_OnDie( sceneId, selfId, killerId )
end
