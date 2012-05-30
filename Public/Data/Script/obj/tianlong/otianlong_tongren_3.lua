--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x714008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  足阳明胃经要穴如下：隐白、大都、太白、公孙、商丘、三阴交、漏谷、血海、箕门、冲门、大横、天溪、大包。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
