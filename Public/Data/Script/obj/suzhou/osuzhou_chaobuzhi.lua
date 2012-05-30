--苏州NPC
--晁补之
--一般

--**********************************
--事件交互入口
--**********************************
function x001005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  张耒兄和贺年兄才华都远在我之上。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
