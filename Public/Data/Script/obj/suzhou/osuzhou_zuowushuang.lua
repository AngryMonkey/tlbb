--大理NPC
--左无双
--服装店

x001052_g_shoptableindex=23

--**********************************
--事件交互入口
--**********************************
function x001052_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001052_g_shoptableindex )
end
