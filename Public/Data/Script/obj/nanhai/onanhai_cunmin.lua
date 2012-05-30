--南海NPC
--岳仲秋
--普通

--**********************************
--事件交互入口
--**********************************
function x034004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  鳄鱼帮的小伙子们越来越不像话了，比比人家李老太太的儿子，简直一个天上，一个地下。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
