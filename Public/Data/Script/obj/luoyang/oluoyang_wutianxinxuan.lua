--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000048_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ι��кܶ�ֵ������ѧϰ�Ķ������ر��ǡ����ӱ��������������ϴ��ϣ�������������Ժúý���һ�¡�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
