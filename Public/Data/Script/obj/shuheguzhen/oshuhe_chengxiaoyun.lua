--束河古镇NPC
--程小云
--一般

x001212_g_MsgInfo = { "#{SHGZ_0612_29}",
											"#{SHGZ_0620_85}",
											"#{SHGZ_0620_86}",
											"#{SHGZ_0620_87}",
										}

--**********************************
--事件交互入口
--**********************************
function x001212_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001212_g_MsgInfo))
		AddText(sceneId, x001212_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
