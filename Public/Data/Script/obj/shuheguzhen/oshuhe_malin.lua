--束河古镇NPC....
--武器店....

x001179_g_scriptId = 001179
x001179_g_shoptableindex = 21

--**********************************
--事件交互入口
--**********************************
function x001179_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001179_g_shoptableindex )
end
