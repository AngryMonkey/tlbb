--黄龙NPC
--洪霸
--野外宝石贩子

x023007_g_scriptId = 023007
x023007_g_shoptableindex = 111

--**********************************
--事件交互入口
--**********************************
function x023007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "我这儿的卖价可比市价低多了，信不信由你。" )
		AddNumText( sceneId, x023007_g_scriptId, "看看你卖的什么", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x023007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		if(GetLevel(sceneId, selfId) < 30 ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BSSR_20080131_01}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		DispatchShopItem( sceneId, selfId, targetId, x023007_g_shoptableindex )
	end
end
