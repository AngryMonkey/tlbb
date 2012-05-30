--NPC
--
--普通

--**********************************
--事件交互入口
--**********************************
function x018112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  这摩崖洞乃是秦家寨匪聚集之所，如果功力不够，最好多找几个同伴一同进入比较安全。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
