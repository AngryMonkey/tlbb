--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155007_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"恭祝二位新人，郎才女貌，白头偕老！");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

