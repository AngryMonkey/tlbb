--大理NPC
--丁励
--普通

--**********************************
--事件交互入口
--**********************************
function x003006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  听说太老爷还活着，怎么可能呢？当年太老爷去世的时候，我亲眼所见啊，这世上真会发生这种事情吗？太不可思议了……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
