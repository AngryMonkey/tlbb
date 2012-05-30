--大理NPC
--兰兰
--普通

--**********************************
--事件交互入口
--**********************************
function x002052_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  王妃每天吃不下，睡不好的，这样下去身子骨会垮掉的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
