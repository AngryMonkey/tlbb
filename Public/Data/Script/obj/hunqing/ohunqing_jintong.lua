--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155006_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"你看那新娘，多漂亮啊！希望哪一天我也能做新郎。");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

