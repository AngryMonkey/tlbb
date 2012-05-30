--洛阳NPC
--男仆
--普通

--**********************************
--事件交互入口
--**********************************
function x000037_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  老爷正在休息，任何人不得打扰。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
