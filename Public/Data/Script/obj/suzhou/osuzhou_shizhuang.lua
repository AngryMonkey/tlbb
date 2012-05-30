--苏州NPC
--师庄
--时装店

x001068_g_shoptableindex=142

--**********************************
--事件交互入口
--**********************************
function x001068_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001068_g_shoptableindex )
end
