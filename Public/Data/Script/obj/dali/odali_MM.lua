--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002054_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0031}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
