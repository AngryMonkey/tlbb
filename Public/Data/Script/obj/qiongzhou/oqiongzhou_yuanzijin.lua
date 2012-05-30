--琼州NPC
--元子衿
--普通

--**********************************
--事件交互入口
--**********************************
function x035002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我们南海鳄鱼帮帮主，就是号称“南海鳄神”的岳老三。这次我是奉三哥之命，去琉球岛把三嫂接来琼州。现在三嫂已经到了，我们略做修整，就去鳄鱼帮找三哥。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
