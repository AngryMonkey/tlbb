--苏州NPC
--公冶干
--一般

--**********************************
--事件交互入口
--**********************************
function x001017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  公子爷一向泰山崩于前而面不改色，这次一筹莫展，一定是遇上了什么非常重要的事情。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
