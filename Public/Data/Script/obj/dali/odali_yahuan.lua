--大理NPC
--丫鬟
--普通

--**********************************
--事件交互入口
--**********************************
function x002047_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我是个丫鬟")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
