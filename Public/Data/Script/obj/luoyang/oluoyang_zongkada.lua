--洛阳NPC
--宗喀达
--普通

--**********************************
--事件交互入口
--**********************************
function x000041_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  洛阳城的空气，远比逻些城的空气稠密。真不适应……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
