--武当NPC
--张函芝
--普通

--**********************************
--事件交互入口
--**********************************
function x012005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"看你的样子，好像有点不大开心。要不要一起出去玩玩？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
