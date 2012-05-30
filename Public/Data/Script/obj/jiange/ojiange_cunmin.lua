--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x007007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  姜家集在闹盗贼呢！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
