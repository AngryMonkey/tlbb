--����NPC
--�˲�֮
--һ��

--**********************************
--�¼��������
--**********************************
function x001005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ֺͺ����ֲŻ���Զ����֮�ϡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
