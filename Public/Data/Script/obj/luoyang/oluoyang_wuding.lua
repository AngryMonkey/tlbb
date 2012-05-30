--洛阳NPC
--伍丁
--普通

--杂货店
x000123_g_shoptableindex=105

--**********************************
--事件交互入口
--**********************************
function x000123_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000123_g_shoptableindex )
end
