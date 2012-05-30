--NPC
--博拉
--普通

--**********************************
--事件交互入口
--**********************************
function x021201_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"银皑雪原到处危机重重，在这里活动可得小心啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
