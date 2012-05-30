--洛阳NPC
--白萌升
--普通

--药店
x000049_g_shoptableindex=14

--**********************************
--事件交互入口
--**********************************
function x000049_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000049_g_shoptableindex )
end
