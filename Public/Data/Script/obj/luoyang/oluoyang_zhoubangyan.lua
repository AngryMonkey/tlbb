--洛阳NPC
--周邦彦
--普通

--**********************************
--事件交互入口
--**********************************
function x000013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  听传言说师师小姐被送进了端王府，真不敢相信这是真的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
