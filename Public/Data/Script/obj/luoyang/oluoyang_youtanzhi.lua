--洛阳NPC
--游坦之
--普通

--**********************************
--事件交互入口
--**********************************
function x000017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  阿紫小姐，美……美如天仙……真想……想天天都看见她……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
