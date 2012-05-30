--雁南NPC
--百姓
--普通

--**********************************
--事件交互入口
--**********************************
function x018007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我们都是好好的大宋百姓，住在雁门关已有几代了，金窝银窝，不如自家的土窝。我们是不会离开的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
