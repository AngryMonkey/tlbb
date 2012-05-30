--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x004008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  也不知道我们倒底要等到什么，快点结束这里的事情，去玉门关支援杨将军吧。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
