--洛阳NPC
--包世商
--普通

x000119_g_shoptableindex=101

--**********************************
--事件交互入口
--**********************************
function x000119_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000119_g_shoptableindex )
end
