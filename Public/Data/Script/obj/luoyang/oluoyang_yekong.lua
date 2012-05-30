--洛阳NPC
--业空
--普通

--**********************************
--事件交互入口
--**********************************
function x000095_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  施主，你终于来了。我师父正在等你呢。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
