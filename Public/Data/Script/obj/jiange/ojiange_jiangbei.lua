--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x007003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_jiange_0003}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
