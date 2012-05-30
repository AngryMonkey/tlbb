--洛阳NPC
--智光
--普通

--**********************************
--事件交互入口
--**********************************
function x000020_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0010}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
