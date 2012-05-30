--束河古镇NPC
--金沙
--一般

x001176_g_MsgInfo = { "#{SHGZ_0612_36}",
											"#{SHGZ_0620_106}",
											"#{SHGZ_0620_107}",
											"#{SHGZ_0620_108}",
										}

--**********************************
--事件交互入口
--**********************************
function x001176_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001176_g_MsgInfo))
		AddText(sceneId, x001176_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
