--少林NPC
--缘根
--普通

--**********************************
--事件交互入口
--**********************************
function x009001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"缘根")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
