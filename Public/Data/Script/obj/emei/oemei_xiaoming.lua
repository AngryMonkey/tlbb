--峨嵋NPC
--小茗
--普通

--**********************************
--事件交互入口
--**********************************
function x015004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  掌门姐姐从苏州回来之后，一连好几天都茶饭不思的，好像有很多的心事呢。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
