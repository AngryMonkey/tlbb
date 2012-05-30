--逍遥NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x014030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  小心，淩波洞中处处是机关，可不要走到禁地之中。如果你需要帮助，请到洞门附近找知客弟子帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
