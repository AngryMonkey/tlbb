--大理NPC
--武士
--普通

--**********************************
--事件交互入口
--**********************************
function x002065_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想要切磋武艺的请上擂台。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
