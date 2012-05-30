--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155004_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"你看那新郎，多帅气啊！希望哪一天我也能做新娘。");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

