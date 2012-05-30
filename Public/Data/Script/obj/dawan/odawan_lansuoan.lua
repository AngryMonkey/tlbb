--NPC
--
--普通

--**********************************
--事件交互入口
--**********************************
function x001163_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  #{DW_20080509_01}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
