--洛阳NPC
--郭天信
--普通

--**********************************
--事件交互入口
--**********************************
function x000014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  最近将有水星淩日的神奇天象出现，有空去看看吧。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
