--苏州NPC
--周敦颐
--一般

--**********************************
--事件交互入口
--**********************************
function x001006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0004}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
