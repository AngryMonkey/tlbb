--梅岭NPC
--冬刺
--普通

--**********************************
--事件交互入口
--**********************************
function x033005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我觉得我用了沈先生的胭脂水粉，也挺好看的啊，要加点腮红就更好了。嗯，睫毛也应该再修一修了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
