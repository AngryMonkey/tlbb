--武当NPC
--黄裳
--普通

--**********************************
--事件交互入口
--**********************************
function x012002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"武当山最近道教发展兴隆，大有超过龙虎山，成为中华第一道教名山之势。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
