--明教NPC
--余道安
--普通

--**********************************
--事件交互入口
--**********************************
function x011009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"圣女大人最近可能不大开心啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
