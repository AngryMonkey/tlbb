--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155003_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"这位英雄，有没有意中人了？没有的话，我帮你介绍一个吧？");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

