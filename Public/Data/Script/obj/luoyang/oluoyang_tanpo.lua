--洛阳NPC
--谭婆
--普通

--**********************************
--事件交互入口
--**********************************
function x000024_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0013}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
