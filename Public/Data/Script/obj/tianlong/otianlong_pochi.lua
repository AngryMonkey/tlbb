--天龙NPC
--破痴
--普通

--**********************************
--事件交互入口
--**********************************
function x013006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  小僧法号破痴，在大理城拈花寺出家，是来天龙寺挂单的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
