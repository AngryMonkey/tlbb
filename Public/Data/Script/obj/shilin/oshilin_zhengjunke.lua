--石林NPC
--郑君可
--普通

--**********************************
--事件交互入口
--**********************************
function x026005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    我叫郑君可，爹爹和姑爹都出远门了。姑姑天天都在哭。其实她不用哭的啊，爹爹和姑爹总有一天会回来的啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
