--丐帮NPC
--刘竹庄
--普通

--**********************************
--事件交互入口
--**********************************
function x010003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"全舵主在帮内的位置升得很快，我也要向他学习！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
