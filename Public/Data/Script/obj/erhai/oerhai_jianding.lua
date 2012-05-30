--洱海NPC
--简丁
--5～7级鉴定商

x024006_g_scriptId = 024006
x024006_g_shoptableindex = 139

--**********************************
--事件交互入口
--**********************************
function x024006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    没错，我就是卖鉴定符的，你要么？" )
		AddNumText( sceneId, x024006_g_scriptId, "购买鉴定符", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x024006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x024006_g_shoptableindex )
	end
end
