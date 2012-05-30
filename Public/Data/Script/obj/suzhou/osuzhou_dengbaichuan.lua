--苏州NPC
--邓百川
--一般

--**********************************
--事件交互入口
--**********************************
function x001016_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  公子爷举手投足都像极了老爷，只是年纪未到，有待成熟而已。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
