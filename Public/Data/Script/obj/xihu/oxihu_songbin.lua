--西湖NPC
--士兵
--普通

--**********************************
--事件交互入口
--**********************************
function x030006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  张将军用兵如神，水鬼的势力现在越来越弱小了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
