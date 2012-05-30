--苏州NPC
--魏汉津
--一般

--**********************************
--事件交互入口
--**********************************
function x001013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  苏学士，琴声不在琴上，不在指上，而在心中。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
