--洛阳NPC
--萧奉先
--普通

--**********************************
--事件交互入口
--**********************************
function x000032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  太后让我们来宋朝好好进行蹴鞠比赛。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
