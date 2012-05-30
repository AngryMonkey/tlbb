--束河古镇NPC....
--虫鸟坊坊主....

x001186_g_scriptId = 001186
x001186_g_shoptableindex = 27

x001186_g_MsgInfo = { "#{SHGZ_0612_08}",
											"#{SHGZ_0620_22}",
											"#{SHGZ_0620_23}",
											"#{SHGZ_0620_24}",
										}

--**********************************
--事件交互入口
--**********************************
function x001186_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local msgidx = random(getn(x001186_g_MsgInfo))
		AddText( sceneId, x001186_g_MsgInfo[msgidx] )
		AddNumText( sceneId, x001186_g_scriptId, "看看你卖的东西", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001186_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x001186_g_shoptableindex )
	end
end
