--NPC
--
--普通

--**********************************
--事件交互入口
--**********************************
function x001162_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  #{DW_20080509_02}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
