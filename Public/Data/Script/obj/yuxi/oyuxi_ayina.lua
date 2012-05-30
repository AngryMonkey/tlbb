--玉溪NPC
--阿依娜
--普通

--**********************************
--事件交互入口
--**********************************
function x027006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  阿妈到底什么时候才能原谅阿爸呀？如果阿妈和阿爸还能像以前一样在一起就好了，那我就可以天天见到萝卜哥哥了，多好呀！也不知道萝卜哥哥这几天在忙什么，都不来陪我玩。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
