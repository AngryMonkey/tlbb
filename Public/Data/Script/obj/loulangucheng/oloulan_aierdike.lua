--楼兰NPC....
--材料商人....

x001124_g_scriptId = 001124
x001124_g_shoptableindex = 18

--**********************************
--事件交互入口
--**********************************
function x001124_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001124_g_shoptableindex )
end
