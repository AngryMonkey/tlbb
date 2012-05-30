--玉溪NPC
--萝卜
--普通

--**********************************
--事件交互入口
--**********************************
function x027003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  你好。#r  我的名字是萝卜。#r  我阿爸的名字是索姆拉。#r  我阿妈的名字是古鲁拉。#r  我妹妹的名字是阿依娜。#r  ……#r  处理完毕。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
