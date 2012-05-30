--楼兰NPC....
--当铺材料商人....

x001110_g_scriptId = 001110
x001110_g_shoptableindex = 18

--**********************************
--事件交互入口
--**********************************
function x001110_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001110_g_shoptableindex )
end
