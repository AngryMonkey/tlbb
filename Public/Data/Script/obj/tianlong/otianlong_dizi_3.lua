--大理NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x013032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我是大理派弟子。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
