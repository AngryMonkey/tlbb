--少林NPC
--萧远山
--普通

--**********************************
--事件交互入口
--**********************************
function x009006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"不让看，我偏要看！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
