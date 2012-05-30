--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x004004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  行军打仗虽然战术战略等各方面都很重要，但是我认为，人心更为重要，得人心者得天下啊！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
