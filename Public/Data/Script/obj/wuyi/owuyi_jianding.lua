--武夷NPC
--涧汀
--5～8级鉴定商

x032006_g_scriptId = 032006
x032006_g_shoptableindex = 140

--**********************************
--事件交互入口
--**********************************
function x032006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    我这里有一些可以鉴定装备的书卷，你不看看么？" )
		AddNumText( sceneId, x032006_g_scriptId, "购买鉴定符", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x032006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x032006_g_shoptableindex )
	end
end
