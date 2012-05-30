--峨嵋NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x015033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<凤凰的鸣叫声响彻云端>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
