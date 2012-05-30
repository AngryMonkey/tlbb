--束河古镇NPC
--姜蓬城
--一般

x001215_g_MsgInfo = { "#{SHGZ_0612_32}",
											"#{SHGZ_0620_94}",
											"#{SHGZ_0620_95}",
											"#{SHGZ_0620_96}",
										}

--**********************************
--事件交互入口
--**********************************
function x001215_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001215_g_MsgInfo))
		AddText(sceneId, x001215_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
