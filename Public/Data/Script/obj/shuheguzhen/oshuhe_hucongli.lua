--束河古镇NPC....
--材料商人....

x001196_g_scriptId = 001196
x001196_g_shoptableindex = 18

--**********************************
--事件交互入口
--**********************************
function x001196_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001196_g_shoptableindex )
end
