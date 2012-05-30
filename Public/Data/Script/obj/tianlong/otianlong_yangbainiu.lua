--天龙NPC
--杨白牛
--普通

x013020_g_shoptableindex=42

--**********************************
--事件交互入口
--**********************************
function x013020_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x013020_g_shoptableindex )
end
