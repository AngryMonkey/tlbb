--洛阳NPC
--乔清盛
--普通

--**********************************
--事件交互入口
--**********************************
function x000052_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0016}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
