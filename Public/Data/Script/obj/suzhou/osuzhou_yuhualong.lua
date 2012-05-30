--����NPC		����npc		1ѧϰ���Ҽ���		2���Ҽ���˵��
--�໯��
--�����npc

--�ű���
x001042_g_ScriptId = 001042

--�̵���
x001042_g_shoptableindex=68

--��ӵ�е��¼�Id�б�
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--��ӵ�е��¼�ID�б�
x001042_g_eventList={713506,713565,713605}
--**********************************
--�¼��б�
--**********************************
function x001042_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0015}")
	for i, eventId in x001042_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x001042_g_ScriptId,"�������ͼ",7,ABILITY_TEACHER_SHOP)
	AddNumText(sceneId,x001042_g_ScriptId,"#{INTERFACE_XML_1195}",7,12)	 
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001042_OnDefaultEvent( sceneId, selfId,targetId )
	x001042_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001042_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001042_g_shoptableindex )
	elseif GetNumText()== 12 then
	  DispatchShopItem( sceneId, selfId,targetId, 200 ) 
	end
	for i, findId in x001042_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001042_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001042_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001042_g_eventList do
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
function x001042_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001042_g_eventList do
		if missionScriptId == findId then
			x001042_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001042_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001042_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001042_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001042_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001042_OnDie( sceneId, selfId, killerId )
end
