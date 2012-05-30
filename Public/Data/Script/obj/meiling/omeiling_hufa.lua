--梅岭NPC
--护法
--普通

--**********************************
--事件交互入口
--**********************************
function x033008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  翻身了！翻身了！我们要当家作主了！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
