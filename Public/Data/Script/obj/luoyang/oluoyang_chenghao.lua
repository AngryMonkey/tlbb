--����NPC
--���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
