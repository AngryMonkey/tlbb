--大理NPC
--狄成
--普通

--**********************************
--事件交互入口
--**********************************
function x004005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  怎么来了那么多官兵，我都不敢出去抢东西了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
