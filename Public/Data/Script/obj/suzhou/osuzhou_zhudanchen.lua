--����NPC
--�쵤��
--һ��

--**********************************
--�¼��������
--**********************************
function x001020_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
