--����NPC
--�˿�
--һ��

x001040_g_scriptId = 001040

--��ӵ�е��¼�ID�б�
x001040_g_eventList={800115}

--**********************************
--�¼��б�
--**********************************
function x001040_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	--AddText(sceneId,"  �Գ�޽����ޣ�ֻ���������ĳ�ޣ���ȷ��Ҫ������ɱô����ô��Ҳ���ܵ������ĳͷ���")	
	for i, eventId in x001040_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	AddNumText( sceneId, x001040_g_scriptId, "��������", 11, 10 )
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001040_OnDefaultEvent( sceneId, selfId,targetId )
	x001040_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001040_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_068}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	for i, findId in x001040_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
