-- 402104
-- �����л��ʼ��ˢ������Npc

-- 
x402104_g_scriptId = 402104

--��ӵ�е��¼�ID�б�
x402104_g_eventList={402105}

--**********************************
--�¼��б�
--**********************************
function x402104_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ɶ��Ұ���������ˣ���֪������û�еõ�һЩ�����ҵ�Ұ�����������أ�")
		for i, eventId in x402104_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��������
--**********************************
function x402104_OnDefaultEvent( sceneId, selfId,targetId )
	x402104_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402104_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402104_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
