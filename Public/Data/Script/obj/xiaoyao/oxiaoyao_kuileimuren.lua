--NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ң������F-874�����ڽ������ݶ�������#r  10������Ҳ��ֱۡ�#r  20������Ӷ���#r  30�����һӶ���#r  ����20��ѭ����ʼ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
