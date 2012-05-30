--天龙NPC
--齐归蝶
--普通

--**********************************
--事件交互入口
--**********************************
function x013010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  近日给本因大师做了一件新的袈裟，也不知他合身不合身。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
