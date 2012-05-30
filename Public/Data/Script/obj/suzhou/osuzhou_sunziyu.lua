--苏州NPC
--孙子羽
--杂货店
x001045_g_shoptableindex=26

--**********************************
--事件交互入口
--**********************************
function x001045_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001045_g_shoptableindex )
end
