-- 402101
-- �����л��ʼ��ˢ������Npc

-- 
x402101_g_scriptId = 402101

--��ӵ�е��¼�ID�б�
x402101_g_eventList={402102} 	

--**********************************
--�¼��б�
--**********************************
function x402101_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��#r  <���������޵ɴ���˫�������㡭��>")
		for i, eventId in x402101_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��������
--**********************************
function x402101_OnDefaultEvent( sceneId, selfId,targetId )
	x402101_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402101_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402101_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
