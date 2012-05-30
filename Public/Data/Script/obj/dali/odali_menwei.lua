--大理NPC
--门卫
--普通

--**********************************
--事件交互入口
--**********************************
function x002022_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  保卫大理城是我的职责！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
