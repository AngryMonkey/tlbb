--大理NPC
--丁缅
--普通

--**********************************
--事件交互入口
--**********************************
function x003005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  自从发生那件事情后，我们家公子的精神一直不太好，可他倒底看到什么了呀？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
