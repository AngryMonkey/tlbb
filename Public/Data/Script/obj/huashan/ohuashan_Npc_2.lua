--�������������Npc
--��ͨ

--�ű���
x125002_g_scriptId = 125002

--��ӵ�е��¼�ID�б�
x125002_g_eventList={001231}

--**********************************
--�¼��������
--**********************************

function x125002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��Ҫ�뿪�����ˣ�")
		for i, eventId in x125002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x125002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x125002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

