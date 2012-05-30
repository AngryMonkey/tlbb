--大理NPC
--云中鹤
--普通

--**********************************
--事件交互入口
--**********************************
function x002017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
