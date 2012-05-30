--束河古镇NPC
--王漠寒
--一般

x001216_g_MsgInfo = { "#{SHGZ_0612_33}",
											"#{SHGZ_0620_97}",
											"#{SHGZ_0620_98}",
											"#{SHGZ_0620_99}",
										}

--**********************************
--事件交互入口
--**********************************
function x001216_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001216_g_MsgInfo))
		AddText(sceneId, x001216_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
