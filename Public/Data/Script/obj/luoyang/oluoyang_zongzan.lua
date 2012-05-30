--洛阳NPC
--宗赞
--普通

--**********************************
--事件交互入口
--**********************************
function x000026_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  大宋在上届蹴鞠大赛上拿了冠军，这次该我们吐蕃拿冠军了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
