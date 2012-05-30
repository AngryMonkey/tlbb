--苏州NPC
--朱超重
--宝石店

x001060_g_shoptableindex=20

--**********************************
--事件交互入口
--**********************************
function x001060_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001060_g_shoptableindex )
end
