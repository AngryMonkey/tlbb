--��ϪNPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x027006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���赽��ʲôʱ�����ԭ�°���ѽ���������Ͱ��ֻ�������ǰһ����һ��ͺ��ˣ����ҾͿ�����������ܲ�����ˣ����ѽ��Ҳ��֪���ܲ�����⼸����æʲô�������������档")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
