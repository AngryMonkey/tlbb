--大理NPC
--宋将
--普通

--**********************************
--事件交互入口
--**********************************
function x004007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  区区一个明教对我们呼延将军而言，都是小意思了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
