--楼兰NPC....
--服饰店老板....

x001118_g_scriptId = 001118
x001118_g_shoptableindex = 71

--**********************************
--事件交互入口
--**********************************
function x001118_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001118_g_shoptableindex )
end
