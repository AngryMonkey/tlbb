--洛阳NPC
--何生财
--普通

x000074_g_shoptableindex=18

--**********************************
--事件交互入口
--**********************************
function x000074_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000074_g_shoptableindex )
end
