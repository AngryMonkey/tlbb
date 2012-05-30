--峨嵋NPC
--萧湘玉
--普通

x015008_g_shoptableindex=45

--**********************************
--事件交互入口
--**********************************
function x015008_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x015008_g_shoptableindex )
end
