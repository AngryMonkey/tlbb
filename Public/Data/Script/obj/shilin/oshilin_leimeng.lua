--石林NPC
--雷蒙
--普通

--**********************************
--事件交互入口
--**********************************
function x026006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"雷蒙~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
