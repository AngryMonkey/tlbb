--大理NPC
--丫鬟
--普通

--**********************************
--事件交互入口
--**********************************
function x005002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  段老爷没来的时候，小姐天天都在哭，怎么劝都劝不住；可段老爷来了的时候，小姐一下子就高兴起来了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
