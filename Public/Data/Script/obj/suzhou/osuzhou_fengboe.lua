--苏州NPC
--风波恶
--一般

--**********************************
--事件交互入口
--**********************************
function x001019_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想打架吗？那边有个擂台，我们去比试一下，怎么？不敢吗？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
