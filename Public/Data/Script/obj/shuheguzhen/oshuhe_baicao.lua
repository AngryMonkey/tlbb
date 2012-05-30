--束河古镇NPC....
--药店老板....

x001191_g_scriptId = 001191
x001191_g_shoptableindex = 14

--**********************************
--事件交互入口
--**********************************
function x001191_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001191_g_shoptableindex )
end
