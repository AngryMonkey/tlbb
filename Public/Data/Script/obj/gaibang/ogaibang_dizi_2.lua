--丐帮NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x010031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我是丐帮弟子。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
