--梅岭NPC
--银叶
--普通

--**********************************
--事件交互入口
--**********************************
function x033006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  听了荆棘大护法一席话，才知道过去几十年全是白活了。以后大家跟着荆棘大护法，上刀山下油锅，都心甘情愿。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
