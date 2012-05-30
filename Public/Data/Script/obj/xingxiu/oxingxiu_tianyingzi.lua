--星宿NPC
--天鹰子
--普通

x016009_g_shoptableindex=46

--**********************************
--事件交互入口
--**********************************
function x016009_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x016009_g_shoptableindex )
end
