--峨嵋NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x015030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  欢迎你来到峨嵋山。如果你需要帮助，请到山门附近找知客使帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
