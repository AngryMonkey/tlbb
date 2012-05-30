--黄龙NPC
--夕颜
--普通

--**********************************
--事件交互入口
--**********************************
function x023003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我在黄龙镇只生活了几天，但这几天我却觉得无比安逸温暖。比我以前地狱一般的生活，实在是好了不知多少倍。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
