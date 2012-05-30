--峨嵋NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x015032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<花枝招展，妩媚动人>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
