--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x008009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  不明白皇帝陛下为什么要编制汉人军团，我们党项军团的战斗力远远超过汉人啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

