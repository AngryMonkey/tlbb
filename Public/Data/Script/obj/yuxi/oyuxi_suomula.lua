--玉溪NPC
--索姆拉
--普通

--**********************************
--事件交互入口
--**********************************
function x027001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  老夫当年年轻气盛，曾经做了一个会捉老鼠的钟馗给沈大人看。不知道他是真觉得不错，还是故意寒碜我，这事情被他写进了《梦溪笔谈》之中。现在看那个钟馗，简直就是一个小孩子的玩意……#r  唉，人真是不可以不谨慎啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
