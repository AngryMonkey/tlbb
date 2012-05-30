--楼兰NPC....
--首饰店老板....

x001117_g_scriptId = 001117
x001117_g_shoptableindex = 13

--**********************************
--事件交互入口
--**********************************
function x001117_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001117_g_shoptableindex )
end
