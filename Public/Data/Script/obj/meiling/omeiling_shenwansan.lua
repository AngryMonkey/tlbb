--梅岭NPC
--沈万三
--普通

--**********************************
--事件交互入口
--**********************************
function x033001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  没想到这批胭脂水粉卖的这么快，看来这次来对了。途经草原的时候，兰陵郡主还对我的货物大加赞许，我得好好计算一下这次可以赚多少……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
