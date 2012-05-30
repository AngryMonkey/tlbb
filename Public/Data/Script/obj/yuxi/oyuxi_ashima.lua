--玉溪NPC
--阿诗玛
--普通

--**********************************
--事件交互入口
--**********************************
function x027005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  是你救了我吗？阿黑，阿黑哥他在哪里？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
