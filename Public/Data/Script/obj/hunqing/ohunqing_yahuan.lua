--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155002_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"恭祝二位新人，百年好合，早得贵子！");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

