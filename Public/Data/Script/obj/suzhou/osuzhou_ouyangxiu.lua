--����NPC
--ŷ����
--һ��

--**********************************
--�¼��������
--**********************************
function x001001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0001}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
