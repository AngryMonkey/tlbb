--����NPC
--���к�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
