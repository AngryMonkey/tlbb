--星宿NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x016030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想在星宿海平安出入，没点胆子是不行的。如果你需要帮助，请到大门附近找知客弟子帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
