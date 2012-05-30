--梅岭NPC
--荆棘
--普通

--**********************************
--事件交互入口
--**********************************
function x033003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  哪里有压迫，哪里就有反抗。我们山越护法不能再和我们的祖辈父辈一样，受山越女祭司的压迫了！即使我们这一代人失败了，我们的子子孙孙，也会反抗下去的！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
