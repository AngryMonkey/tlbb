--琼州NPC
--悠悠
--普通

--**********************************
--事件交互入口
--**********************************
function x035001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  呜呜……这里有好多的鳄鱼啊，难道子衿哥哥天天就是生活在这样的环境里吗？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--死亡事件
--**********************************
function x035001_OnDie( sceneId, selfId, killerId )
end
