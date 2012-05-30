--梅岭NPC
--祭司
--普通

--**********************************
--事件交互入口
--**********************************
function x033007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  听说武夷山紫薇姐姐那边出了不少事情，好多姐妹都死了……啊，我只知道这些。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
