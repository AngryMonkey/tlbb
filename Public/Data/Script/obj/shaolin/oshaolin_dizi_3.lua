--少林NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x009032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我是少林派弟子。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
