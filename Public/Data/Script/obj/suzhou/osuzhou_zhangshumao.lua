--苏州NPC
--张树茂
--一般

--**********************************
--事件交互入口
--**********************************
function x001041_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0014}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
