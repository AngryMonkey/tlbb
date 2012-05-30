--天龙NPC
--枯荣
--普通

--**********************************
--事件交互入口
--**********************************
function x013000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  阿弥陀佛！有常无常，双树枯荣，南北西东，非假非空！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
