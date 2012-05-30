--洛阳NPC
--张浚
--普通

--**********************************
--事件交互入口
--**********************************
function x000098_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  今年，我们大宋一定还会拿第一的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
