--大理NPC
--黄公道
--服装店

x002024_g_scriptId = 002024
x002024_g_shoptableindex = 2

--**********************************
--事件交互入口
--**********************************
function x002024_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    本店有大量商品出售，欢迎选购！" )
		AddNumText( sceneId, x002024_g_scriptId, "看看你卖的东西", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002024_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002024_g_shoptableindex )
	end
end
