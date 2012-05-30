--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155001_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"如果你有了喜欢的人，可以一起来找我。我可以帮你们主持婚礼。");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

