-- 1062

--����NPC
--��ɽ�۽�������
--��ͨ

--�ű���
x001064_g_scriptId = 001064

--��ӵ�е��¼�ID�б�
x001064_g_eventList={001230} --{001230}


--**********************************
--�¼��������
--**********************************
function x001064_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �׻�˵�úã����޵�һ�����޵ڶ���������ʿ����Ҫ�ڻ�ɽ�۽�����һ�����µ�һ�����š������Ҳ��μӻ�ɽ�۽����ҿ���Ϊ�㱨��������ȥ��ɽ��    �μӻ�ɽ�۽��������������ڱ���������ǰ�����Ϳ�������������ȡ��͢�䷢�ı���һ�ݣ���λŬ������")
		
		AddNumText( sceneId, x001064_g_scriptId, "��ɽ�۽�����", 11, 10 )	
		
		for i, eventId in x001064_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- ѡ��һ��
--**********************************
function x001064_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_064}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	for i, findId in x001064_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end
