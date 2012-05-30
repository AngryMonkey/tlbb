--洛阳NPC
--陶得宝
--普通

--武器店
x000116_g_shoptableindex=71

--**********************************
--事件交互入口
--**********************************
function x000116_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000116_g_shoptableindex )
end
