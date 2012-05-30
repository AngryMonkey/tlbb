--辽西NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x021005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我们现在被马匪攻击，主要是因为现在我们蒙古人太少，而且不团结。总有一天，一位伟大的汗会领导蒙古人走向胜利的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
