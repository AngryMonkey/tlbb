--����NPC
--л��
--һ��

--**********************************
--�¼��������
--**********************************
function x001027_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����̻����Ͼ�Ҫ��ʽ��ҵ�ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
