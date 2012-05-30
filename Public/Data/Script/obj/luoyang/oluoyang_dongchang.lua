--洛阳NPC
--董昌
--普通

--武器店
x000117_g_shoptableindex=72

--**********************************
--事件交互入口
--**********************************
function x000117_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000117_g_shoptableindex )
end
