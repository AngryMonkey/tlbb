--ؤ��NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������ؤ���ܶ档�������Ҫ�������뵽Ժ�Ÿ�����֪��ؤ��æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
