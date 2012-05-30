--苏州NPC
--雨墨
--一般

--**********************************
--事件交互入口
--**********************************
function x001034_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我们公子才高八斗，一定会高中的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
