--梅岭NPC
--太阳花
--普通

--**********************************
--事件交互入口
--**********************************
function x033002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  男人？在山越部族，男人就是奴仆，男人生来就只能做护法，是被我们祭司使唤的。这个风俗从几千年前开始就是这样的，这是神的旨意，不可以违抗的！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
