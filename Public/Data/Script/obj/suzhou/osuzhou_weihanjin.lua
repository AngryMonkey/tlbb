--����NPC
--κ����
--һ��

--**********************************
--�¼��������
--**********************************
function x001013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ѧʿ�������������ϣ�����ָ�ϣ��������С�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
