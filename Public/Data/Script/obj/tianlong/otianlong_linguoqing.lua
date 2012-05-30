--天龙NPC
--林国清
--普通

--**********************************
--事件交互入口
--**********************************
function x013008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  下官名叫林国清，是奉当今圣上之命，来看望老皇爷的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
