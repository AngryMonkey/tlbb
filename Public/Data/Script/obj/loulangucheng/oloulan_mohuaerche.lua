--¥��NPC....
--���켼�ܴ�ʦ....

--�ű���
x001104_g_ScriptId = 001104

--��ӵ�е��¼�Id�б�
--estudy_zhuzao = 713505
--elevelup_zhuzao = 713564
--edialog_zhuzao = 713604
--��ӵ�е��¼�ID�б�
x001104_g_eventList={713505,713564,713604}

--**********************************
--�¼��б�
--**********************************
function x001104_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_05}")
		for i, eventId in x001104_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x001104_g_ScriptId, "#{INTERFACE_XML_1197}", 7, 27 )
		AddNumText( sceneId, x001104_g_ScriptId, "#{INTERFACE_XML_1194}", 7, 28 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001104_OnDefaultEvent( sceneId, selfId,targetId )
	x001104_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001104_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 27 then 
	   DispatchShopItem( sceneId, selfId, targetId, 205 )                    
	elseif GetNumText() == 28 then 
	   DispatchShopItem( sceneId, selfId, targetId, 202 )                    
	end
	for i, findId in x001104_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001104_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001104_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001104_g_eventList do
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
function x001104_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001104_g_eventList do
		if missionScriptId == findId then
			x001104_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001104_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001104_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001104_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001104_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
