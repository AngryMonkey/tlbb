--����NPC
--��ɽ
--һ��

--**********************************
--�¼��������
--**********************************
function x001023_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������������������ɽ�����ɸ�����ɽ�⣡")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
