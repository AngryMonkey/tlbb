--少林NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x009030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  此处就是武林圣地少林寺。如果你需要帮助，请到寺门附近找知客僧帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
