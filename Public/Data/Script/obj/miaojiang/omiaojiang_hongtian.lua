--苗疆NPC
--洪天
--野外宝石贩子

x029006_g_scriptId = 029006
x029006_g_shoptableindex = 109

--**********************************
--事件交互入口
--**********************************
function x029006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "看货可以，别想打听我这儿宝石的来路，我们兄弟几个可就这条生路了。" )
		AddNumText( sceneId, x029006_g_scriptId, "看看你有什么好货", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x029006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		if(GetLevel(sceneId, selfId) < 30 ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BSSR_20080131_01}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		DispatchShopItem( sceneId, selfId, targetId, x029006_g_shoptableindex )
	end
end
