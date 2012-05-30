--辽西NPC
--武吉
--5级打造图纸商

x021007_g_scriptId = 021007
x021007_g_shoptableindex = 107

--**********************************
--事件交互入口
--**********************************
function x021007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    最近来我这里买打造图纸的客人越来越多了，怎么，中原又要打起来了？" )
		AddNumText( sceneId, x021007_g_scriptId, "看看你卖的东西", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x021007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x021007_g_shoptableindex )
	end
end
