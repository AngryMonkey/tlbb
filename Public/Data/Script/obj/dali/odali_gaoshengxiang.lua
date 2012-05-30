--大理NPC
--高升祥
--杂货店

x002057_g_shoptableindex=6

--**********************************
--事件交互入口
--**********************************
function x002057_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x002057_g_shoptableindex )
end
