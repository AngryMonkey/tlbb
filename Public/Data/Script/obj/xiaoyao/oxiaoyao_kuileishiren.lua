--NPC
--傀儡
--普通

--**********************************
--事件交互入口
--**********************************
function x014010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  逍遥傀儡人F-16型已经从一个严重的系统错误中恢复。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
