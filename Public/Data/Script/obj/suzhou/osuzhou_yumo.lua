--����NPC
--��ī
--һ��

--**********************************
--�¼��������
--**********************************
function x001034_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ǹ��ӲŸ߰˶���һ������еġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
