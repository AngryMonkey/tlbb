-- 125014
-- ����װ��

--�ű���
x125014_g_scriptId = 125014

--��ӵ�е��¼�ID�б�
x125014_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x125014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ҿ����������е�40�����ϵ�װ�������������������߻�����Ʒ������Ҳ������Ϊ�ҵ���ѧ�յ�ʱ���ʲô������Ȥ����������Ҷ���һ���涼���㾫ͨ�������������ʱ��ɹ��ʲ���100��Ŷ�������û��ʲô����Ļ��������Ұ�������ɡ�")
		AddNumText(sceneId,x125014_g_scriptId,"��Ҫ����װ��",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x125014_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )	
	end
end

