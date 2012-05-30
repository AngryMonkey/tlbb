--苏州NPC
--曾巩
--一般

--**********************************
--事件交互入口
--**********************************
function x001003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0003}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
