--大理NPC
--左季高
--服装店

x001046_g_shoptableindex=22

--**********************************
--事件交互入口
--**********************************
function x001046_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001046_g_shoptableindex )
end
