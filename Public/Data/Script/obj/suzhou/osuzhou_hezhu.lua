--苏州NPC
--贺铸
--一般

--**********************************
--事件交互入口
--**********************************
function x001010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0006}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
