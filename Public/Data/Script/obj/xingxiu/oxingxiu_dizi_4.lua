--星宿NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x016033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我是星宿派弟子。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
