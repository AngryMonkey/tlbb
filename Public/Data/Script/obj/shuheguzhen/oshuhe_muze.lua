--束河古镇NPC
--木泽
--一般

x001202_g_MsgInfo = { "#{SHGZ_0612_19}",
											"#{SHGZ_0620_55}",
											"#{SHGZ_0620_56}",
											"#{SHGZ_0620_57}",
										}

--**********************************
--事件交互入口
--**********************************
function x001202_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001202_g_MsgInfo))
		AddText(sceneId, x001202_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
