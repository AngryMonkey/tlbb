--ؤ��NPC
--������
--�γ���
--��ͨ

x010005_g_scriptId = 010005
x010005_g_eventList = {229009,229012,808092}

--**********************************
--�¼��������
--**********************************
function x010005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ؤ����Ҫ��չ׳�󣬻��治��ֻ������ؤ�����������һ�����ӣ�����ǰ�Ǹ����С�")
		for i, findId in x010005_g_eventList do
			CallScriptFunction( x010005_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x010005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_GAIBANG )
			return
		end
	end
end

