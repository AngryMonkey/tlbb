--少林NPC
--玄生
--普通

x009010_g_shoptableindex=41

--**********************************
--事件交互入口
--**********************************
function x009010_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x009010_g_shoptableindex )
end
