--洛阳NPC
--贾作珍
--普通

--杂货店
x000054_g_shoptableindex=13

--**********************************
--事件交互入口
--**********************************
function x000054_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000054_g_shoptableindex )
end
