--明教NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x011030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  光明殿重地，不得随意走动！如果你需要帮助，就去大门附近找知客使帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
