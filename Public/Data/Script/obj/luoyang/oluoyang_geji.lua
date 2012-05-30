--洛阳NPC
--歌伎
--普通

--**********************************
--事件交互入口
--**********************************
function x000045_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我是小丫鬟，主子的事情我可不知道。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
