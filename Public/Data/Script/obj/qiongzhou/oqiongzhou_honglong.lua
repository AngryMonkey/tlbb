--琼州NPC
--洪龙
--野外宝石贩子

x035007_g_scriptId = 035007
x035007_g_shoptableindex = 110

--**********************************
--事件交互入口
--**********************************
function x035007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "为了卖几颗破石头我们兄弟整天东奔西跑的，你说我容易嘛我。" )
		AddNumText( sceneId, x035007_g_scriptId, "看看你卖的石头", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x035007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		if(GetLevel(sceneId, selfId) < 30 ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BSSR_20080131_01}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		DispatchShopItem( sceneId, selfId, targetId, x035007_g_shoptableindex )
	end
end
