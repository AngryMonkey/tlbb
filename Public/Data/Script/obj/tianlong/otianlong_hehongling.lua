--天龙NPC
--何红绫
--普通

--**********************************
--事件交互入口
--**********************************
function x013012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  本相大师最近总向我提起他的一个后辈，此人是当今皇上的侄儿，名叫段誉。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
