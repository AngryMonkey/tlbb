--束河古镇NPC....
--当铺材料商人....

x001185_g_scriptId = 001185
x001185_g_shoptableindex = 18

--**********************************
--事件交互入口
--**********************************
function x001185_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001185_g_shoptableindex )
end
