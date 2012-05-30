--苏州NPC
--朱丹臣
--一般

--**********************************
--事件交互入口
--**********************************
function x001020_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
