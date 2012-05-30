--天山NPC
--任飞虹
--普通

x017010_g_shoptableindex=48

--**********************************
--事件交互入口
--**********************************
function x017010_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x017010_g_shoptableindex )
end
