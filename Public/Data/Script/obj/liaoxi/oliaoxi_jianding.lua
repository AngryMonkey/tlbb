--辽西NPC
--剑定
--7～10级鉴定商

x021008_g_scriptId = 021008
x021008_g_shoptableindex = 141

--**********************************
--事件交互入口
--**********************************
function x021008_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    我自认在鉴定方面的造诣还过的去，有什么可以帮你的？" )
		AddNumText( sceneId, x021008_g_scriptId, "购买鉴定符", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x021008_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x021008_g_shoptableindex )
	end
end
