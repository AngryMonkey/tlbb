--NPC
--
--普通

--**********************************
--事件交互入口
--**********************************
function x001135_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_01}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
