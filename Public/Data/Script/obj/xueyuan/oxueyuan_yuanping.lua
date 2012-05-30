--NPC
--袁平
--普通

--**********************************
--事件交互入口
--**********************************
function x021202_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"你见过被封在冰块里的巨人吗？真想知道他是怎么来的……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
