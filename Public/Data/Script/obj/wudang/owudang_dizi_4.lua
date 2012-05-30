--武当NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x012033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我是武当派弟子。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
