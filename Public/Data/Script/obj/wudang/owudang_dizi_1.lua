--武当NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x012030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  圆转如意，清静无为，这里就是武当山。如果你需要帮助，请到山门附近找知客道人帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
