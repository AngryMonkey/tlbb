--束河NPC
--步青云
--宝石商人

x001174_g_shoptableindex=186

--**********************************
--事件交互入口
--**********************************
function x001174_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x001174_g_shoptableindex )
end
