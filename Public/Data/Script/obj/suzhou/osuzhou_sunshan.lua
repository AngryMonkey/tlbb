--苏州NPC
--孙山
--一般

--**********************************
--事件交互入口
--**********************************
function x001023_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  哈哈，解名尽处是孙山，贤郎更在孙山外！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
