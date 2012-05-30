--苏州NPC
--柳金蟾
--一般

--**********************************
--事件交互入口
--**********************************
function x001038_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  有个来苏州考试的考生叫颜查散，他真好玩。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
