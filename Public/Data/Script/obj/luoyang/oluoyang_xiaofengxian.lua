--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ̫�����������γ��úý�����ϱ�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
