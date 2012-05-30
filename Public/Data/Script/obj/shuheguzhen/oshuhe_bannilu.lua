--束河古镇NPC....
--服饰店老板....

x001193_g_scriptId = 001193
x001193_g_shoptableindex = 71

--**********************************
--事件交互入口
--**********************************
function x001193_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001193_g_shoptableindex )
end
