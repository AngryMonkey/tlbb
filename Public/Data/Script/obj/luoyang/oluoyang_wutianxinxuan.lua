--洛阳NPC
--武田信玄
--普通

--**********************************
--事件交互入口
--**********************************
function x000048_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  大宋国有很多值得我们学习的东西，特别是《孙子兵法》，趁这次蹴鞠大会希望我们两国可以好好交流一下。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
