--黄龙NPC
--宇文苏
--普通

--**********************************
--事件交互入口
--**********************************
function x023002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  阿文最近不知道怎么了，不吃饭，不睡觉，整天都在那里发呆……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
