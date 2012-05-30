--梅岭NPC
--甘草
--普通

--**********************************
--事件交互入口
--**********************************
function x033004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  荆棘大护法说得好，梅岭的大事小情，无不在大护法的算计之中。我们都照着大护法的意思去做，就算死一万次，也比稀里糊涂活着快活得多。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
