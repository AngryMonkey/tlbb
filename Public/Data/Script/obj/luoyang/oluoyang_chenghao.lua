--洛阳NPC
--程颢
--普通

--**********************************
--事件交互入口
--**********************************
function x000008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
