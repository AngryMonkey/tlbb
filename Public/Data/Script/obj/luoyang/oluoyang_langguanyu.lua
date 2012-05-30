--洛阳NPC
--郎冠宇
--普通

--药店
x000065_g_shoptableindex=32

--**********************************
--事件交互入口
--**********************************
function x000065_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000065_g_shoptableindex )
end
