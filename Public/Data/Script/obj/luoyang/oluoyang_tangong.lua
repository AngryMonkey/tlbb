--洛阳NPC
--谭公
--普通

--**********************************
--事件交互入口
--**********************************
function x000023_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0012}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
