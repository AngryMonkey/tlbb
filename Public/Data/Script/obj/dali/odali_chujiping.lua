--大理NPC
--初击平
--鉴定符商人

x002077_g_scriptId = 002077
x002077_g_shoptableindex = 10

--**********************************
--事件交互入口
--**********************************
function x002077_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    本人出售独家秘制鉴定符，可以鉴定所有类型的装备，欢迎选购！" )
		AddNumText( sceneId, x002077_g_scriptId, "看看你卖的东西", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002077_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002077_g_shoptableindex )
	end
end
