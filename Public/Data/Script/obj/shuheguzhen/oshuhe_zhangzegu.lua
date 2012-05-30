--束河古镇NPC
--张泽谷
--一般

x001206_g_MsgInfo = { "#{SHGZ_0612_23}",
											"#{SHGZ_0620_67}",
											"#{SHGZ_0620_68}",
											"#{SHGZ_0620_69}",
										}

--**********************************
--事件交互入口
--**********************************
function x001206_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001206_g_MsgInfo))
		AddText(sceneId, x001206_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
