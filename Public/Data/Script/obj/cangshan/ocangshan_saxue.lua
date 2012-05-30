--NPC萨雪
--苍山
--普通

--**********************************
--事件交互入口
--**********************************
function x025112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"每年冬天，这里的雪无边无际，席卷而来。它在暗示着什么呢？呵！这真是一个奇妙又略显恐怖的世界！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
