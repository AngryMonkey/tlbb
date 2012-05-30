--����NPC		����npc		1ѧϰ���Ҽ���		2��ҽ����˵��
--����֮
--�����npc

--�ű���
x000067_g_ScriptId = 000067

--�̵���
x000067_g_shoptableindex=65

--��ӵ�е��¼�Id�б�
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--��ӵ�е��¼�ID�б�
x000067_g_eventList={713506,713565}--,713605}
--**********************************
--�¼��б�
--**********************************
function x000067_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_luoyang_0020}")
	for i, eventId in x000067_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x000067_g_ScriptId,"�������ͼ",7,ABILITY_TEACHER_SHOP)
	AddNumText(sceneId,x000067_g_ScriptId,"#{INTERFACE_XML_1195}",7,12)      
	AddNumText( sceneId, x000067_g_ScriptId, "���ҽ���", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000067_OnDefaultEvent( sceneId, selfId,targetId )
	x000067_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000067_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_010}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000067_g_shoptableindex )
	elseif GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 200 ) 
	end
	for i, findId in x000067_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000067_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000067_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000067_g_eventList do
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
function x000067_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			x000067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000067_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000067_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000067_OnDie( sceneId, selfId, killerId )
end
