--����NPC
--̷��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000024_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0013}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
