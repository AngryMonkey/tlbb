--苏州NPC
--王圭
--一般

--**********************************
--事件交互入口
--**********************************
function x001008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  楚大人，这次的配方比例应该没有错了吧？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
