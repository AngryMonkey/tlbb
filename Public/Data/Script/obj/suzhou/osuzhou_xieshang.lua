--苏州NPC
--谢尚
--一般

--**********************************
--事件交互入口
--**********************************
function x001027_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  九州商会马上就要正式开业了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
