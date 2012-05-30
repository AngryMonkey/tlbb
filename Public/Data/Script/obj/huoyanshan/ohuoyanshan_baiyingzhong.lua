--火焰山NPC
--白映中
--药品商店

x042500_g_ScriptId	= 042500

--药店
x042500_g_shoptableindex = 179

--**********************************
--事件交互入口
--**********************************
function x042500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  $N，#{HYS_20071224_02}" )
		AddNumText( sceneId, x042500_g_ScriptId, "#{HYS_20071224_03}", 7, 100 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--事件列表选中一项
--**********************************
function x042500_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	if key == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x042500_g_shoptableindex )
	end
end
