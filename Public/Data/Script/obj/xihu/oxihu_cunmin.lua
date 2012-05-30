--西湖NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x030005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  虎跑村现在可不平静啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
