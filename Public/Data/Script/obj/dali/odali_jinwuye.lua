--大理NPC
--金五爷
--元宝商人

--**********************************
--事件交互入口
--**********************************
function x002059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  行走江湖，当然是谁拳头硬谁就是大爷。但俗话说得好，有钱能使磨推鬼，手里有了元宝，就能使很多难办的事情变得简单起来。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
