--束河古镇NPC....
--首饰店老板....

x001192_g_scriptId = 001192
x001192_g_shoptableindex = 13

--**********************************
--事件交互入口
--**********************************
function x001192_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001192_g_shoptableindex )
end
