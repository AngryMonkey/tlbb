--琼州NPC
--岳老三
--普通

--**********************************
--事件交互入口
--**********************************
function x035004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  最近我在大理新拜了一位师父，本事非同小可。不说别的，单是这位师父的“淩波微步”绝技，相信世上便无第二人会得。#r  这次回琼州，主要就是来接我老婆的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
