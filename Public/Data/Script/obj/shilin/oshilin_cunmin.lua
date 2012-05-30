--石林NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x026008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  圆月村，唉，村子里没有几家还是完整团圆的了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
