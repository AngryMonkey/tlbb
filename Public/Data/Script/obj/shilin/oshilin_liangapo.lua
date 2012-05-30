--石林NPC
--梁阿婆
--普通

--**********************************
--事件交互入口
--**********************************
function x026002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"梁阿婆~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
