--苏州NPC
--张小泉
--普通

--武器店
x000066_g_shoptableindex=21

--**********************************
--事件交互入口
--**********************************
function x000066_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000066_g_shoptableindex )
end
