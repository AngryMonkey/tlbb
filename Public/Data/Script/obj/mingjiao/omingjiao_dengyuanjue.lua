--明教NPC
--邓元觉
--普通

x011012_g_shoptableindex=43

--**********************************
--事件交互入口
--**********************************
function x011012_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x011012_g_shoptableindex )
end
