--束河古镇NPC
--酒店老板
--普通

x001187_g_scriptId = 001187
x001187_g_shoptableindex = 25

x001187_g_MsgInfo = { "#{SHGZ_0612_09}",
											"#{SHGZ_0620_25}",
											"#{SHGZ_0620_26}",
											"#{SHGZ_0620_27}",
										}

--**********************************
--事件交互入口
--**********************************
function x001187_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		local msgidx = random(getn(x001187_g_MsgInfo))
		AddText(sceneId, x001187_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001187_g_scriptId, "看看你卖的东西", 7, 28 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x001187_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 28 then
		DispatchShopItem( sceneId, selfId, targetId, x001187_g_shoptableindex )
		return 0
	end
end
