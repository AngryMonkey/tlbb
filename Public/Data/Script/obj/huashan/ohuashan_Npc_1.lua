--����ս����Npc
--��ͨ

--�ű���
x125001_g_scriptId = 125001

--��ӵ�е��¼�ID�б�
x125001_g_eventList={001232}

--**********************************
--�¼��������
--**********************************
function x125001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��Ҫ����ս������׼������û�У�")
		for i, eventId in x125001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x125001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x125001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

