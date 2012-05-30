--梅岭NPC
--克里斯蒂安
--普通

--**********************************
--事件交互入口
--**********************************
function x033011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  亲爱的朋友！快来帮帮我啊！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--死亡事件
--**********************************
function x033011_OnDie( sceneId, selfId, killerId )
end
