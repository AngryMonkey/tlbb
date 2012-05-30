--洛阳NPC
--林金龙
--普通

--武器店
x000115_g_shoptableindex=70

--**********************************
--事件交互入口
--**********************************
function x000115_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000115_g_shoptableindex )
end
