--武当NPC
--张君慕
--普通

x012008_g_shoptableindex=44

--**********************************
--事件交互入口
--**********************************
function x012008_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x012008_g_shoptableindex )
end
