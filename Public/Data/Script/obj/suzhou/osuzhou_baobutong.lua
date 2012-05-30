--苏州NPC
--包不同
--一般

--**********************************
--事件交互入口
--**********************************
function x001018_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  非也非也，应该是“平芜尽处是春山，行人更在春山外。”才对。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
