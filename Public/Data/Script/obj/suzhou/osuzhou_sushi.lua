--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0002}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
