--苏州NPC
--楚衍
--一般

--**********************************
--事件交互入口
--**********************************
function x001014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  上有天堂，下有苏杭。苏州的美景，你可曾见识过？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
