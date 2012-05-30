--少林NPC
--慕容博
--普通

--**********************************
--事件交互入口
--**********************************
function x009007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"阿弥陀佛，施主来这藏经阁有何贵干？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
