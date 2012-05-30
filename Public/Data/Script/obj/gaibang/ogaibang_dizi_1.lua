--丐帮NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x010030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  这里是丐帮总舵。如果你需要帮助，请到院门附近找知客丐帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
