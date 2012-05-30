--梅岭NPC
--商队
--普通

--**********************************
--事件交互入口
--**********************************
function x033010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  商队在梅岭已经停了好多天了，货物差不多已经卖光了，这一趟下来大家都能分到不少吧。#r  沈老板真的是个商业天才啊，跟着他做事真是前世积德了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
