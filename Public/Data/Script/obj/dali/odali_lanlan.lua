--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002052_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����ÿ��Բ��£�˯���õģ�������ȥ���ӹǻ����ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
