--苏州NPC
--苏轼
--一般

--**********************************
--事件交互入口
--**********************************
function x001002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0002}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
