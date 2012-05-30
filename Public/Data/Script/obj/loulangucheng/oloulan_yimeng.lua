--¥��NPC....
--���Ҵ�ʦ....

--�ű���
x001127_g_ScriptId = 001127

--��ӵ�е��¼�Id�б�
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--��ӵ�е��¼�ID�б�
x001127_g_eventList={713506,713565,713605}

--**********************************
--�¼��б�
--**********************************
function x001127_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_10}")
		for i, eventId in x001127_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x001127_g_ScriptId, "#{INTERFACE_XML_1197}", 7, 27 )
		AddNumText( sceneId, x001127_g_ScriptId, "#{INTERFACE_XML_1195}", 7, 28 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001127_OnDefaultEvent( sceneId, selfId,targetId )
	x001127_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001127_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 27 then 
	   DispatchShopItem( sceneId, selfId, targetId, 206 )
	elseif GetNumText() == 28 then 
	   DispatchShopItem( sceneId, selfId, targetId, 203 )
	end
	for i, findId in x001127_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001127_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001127_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001127_g_eventList do
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
function x001127_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001127_g_eventList do
		if missionScriptId == findId then
			x001127_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001127_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001127_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001127_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001127_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
