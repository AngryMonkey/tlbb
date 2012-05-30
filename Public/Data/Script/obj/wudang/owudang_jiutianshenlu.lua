--武当NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x012012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<鹤鸣九皋，声闻于天>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
