--束河古镇NPC....
--杂货商人....

x001197_g_scriptId = 001197
x001197_g_shoptableindex = 26

--**********************************
--事件交互入口
--**********************************
function x001197_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001197_g_shoptableindex )
end
