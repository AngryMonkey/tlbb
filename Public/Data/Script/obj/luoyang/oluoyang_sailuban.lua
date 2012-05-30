--洛阳NPC
--赛鲁班
--普通

x000121_g_shoptableindex=103

--**********************************
--事件交互入口
--**********************************
function x000121_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000121_g_shoptableindex )
end
