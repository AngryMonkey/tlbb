--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������ã������պ������ݵ��������������ʶ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
