--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x013015_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"天仙妹妹~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
