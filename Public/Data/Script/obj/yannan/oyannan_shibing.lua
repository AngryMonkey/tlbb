--雁南NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x018006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  跟着种世衡大帅，能建功立业；跟着马承倩监军，能升官发财。可这两件事总是感觉挺矛盾的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
