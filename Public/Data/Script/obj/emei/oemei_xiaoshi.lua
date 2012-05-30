--峨嵋NPC
--小诗
--普通

--**********************************
--事件交互入口
--**********************************
function x015005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  掌门姐姐最近总是谈起一个叫做韩世忠的人，说他是不世出的大英雄，可以和“北乔峰”、“南慕容”并驾齐驱。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
