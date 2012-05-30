--苏州NPC
--范大成
--宝石商人

x001051_g_shoptableindex=31

--**********************************
--事件交互入口
--**********************************
function x001051_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001051_g_shoptableindex )
end
