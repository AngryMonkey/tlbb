--苏州NPC
--胡繁
--服装店

x001053_g_shoptableindex=24

--**********************************
--事件交互入口
--**********************************
function x001053_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001053_g_shoptableindex )
end
