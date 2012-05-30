--苗疆NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x029005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  今天我喝了新调出的黑苗酒，感觉真是太舒服了。古大师的调酒技艺真是叫人不得不叹为观止啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
