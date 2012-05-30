--天龙NPC
--桑飞燕
--普通

--**********************************
--事件交互入口
--**********************************
function x013013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我陪着老皇爷们来到天龙寺已有两年了，但我还一直记得两年前在洛阳城里见到的那个年轻人。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
