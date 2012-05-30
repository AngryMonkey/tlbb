--洛阳NPC
--校尉
--普通

--**********************************
--事件交互入口
--**********************************
function x000091_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  王府重地，不得随意走动！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
