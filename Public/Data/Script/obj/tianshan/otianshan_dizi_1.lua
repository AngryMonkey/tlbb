--天山NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x017030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  灵鹫宫里大多是女子，禁忌颇多。如果你需要帮助，请到山门附近找知客弟子帮忙。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
