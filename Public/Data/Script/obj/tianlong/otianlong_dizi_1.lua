--大理NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x013030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  天龙寺乃是佛门清修之所。如果你需要帮助，请到寺门附近找知客僧帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
