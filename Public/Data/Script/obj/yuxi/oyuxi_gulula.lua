--玉溪NPC
--古鲁拉
--普通

--**********************************
--事件交互入口
--**********************************
function x027002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  那老鬼从来不管老婆孩子，一门心思都在那个萝卜身上。#r  唉，想当年追我的男子成千上万，我怎么会看上这么一个老鬼！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
