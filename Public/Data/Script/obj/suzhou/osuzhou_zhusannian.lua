--苏州NPC
--祝三念
--一般

x001049_g_shoptableindex=28

--**********************************
--事件交互入口
--**********************************
function x001049_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001049_g_shoptableindex )
end
