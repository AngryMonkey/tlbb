--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x007008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_jiange_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
