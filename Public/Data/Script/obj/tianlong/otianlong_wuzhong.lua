--天龙NPC
--伍忠
--普通

--**********************************
--事件交互入口
--**********************************
function x013009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  下官名叫伍忠，是奉当今圣上之命，来看望老皇爷的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
