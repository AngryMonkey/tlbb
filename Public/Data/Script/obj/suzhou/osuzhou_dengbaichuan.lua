--����NPC
--�˰ٴ�
--һ��

--**********************************
--�¼��������
--**********************************
function x001016_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����ү����Ͷ�㶼������ү��ֻ�����δ�����д�������ѡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
