--楼兰NPC....
--杂货商人....

x001125_g_scriptId = 001125
x001125_g_shoptableindex = 26

--**********************************
--事件交互入口
--**********************************
function x001125_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001125_g_shoptableindex )
end
