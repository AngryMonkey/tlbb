--逍遥NPC
--苟读
--普通

x014003_g_shoptableindex=47

--**********************************
--事件交互入口
--**********************************
function x014003_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x014003_g_shoptableindex )
end
