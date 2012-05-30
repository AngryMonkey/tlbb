--����NPC
--ѩ����
--һ��

x001036_g_scriptId = 001036

--��ӵ�е��¼�ID�б�
x001036_g_eventList={800110,800112}

--**********************************
-- �����¼��б�
--**********************************
function x001036_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{OBJ_suzhou_0012}")
	
		-- �����¼��б� x001036_g_eventList �е�ÿһ��� Enumerate ��������ʾѡ����Ŀ
		for i, eventId in x001036_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001036_OnDefaultEvent( sceneId, selfId,targetId )
	x001036_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001036_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- �����¼��б� x001036_g_eventList �е�ÿһ��� DefaultEvent ����
	for i, findId in x001036_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
