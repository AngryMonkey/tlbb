--洛阳NPC
--沈含香
--普通

--武器店
x002071_g_shoptableindex=74

--**********************************
--事件交互入口
--**********************************
function x002071_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x002071_g_shoptableindex )
end
