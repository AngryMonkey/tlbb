--洛阳NPC
--甄唯思
--普通

--装备店
x000051_g_shoptableindex=12

--**********************************
--事件交互入口
--**********************************
function x000051_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000051_g_shoptableindex )
end
