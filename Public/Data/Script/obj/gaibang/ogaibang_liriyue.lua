--丐帮NPC
--李日越
--普通

--脚本号
x010011_g_scriptId			= 010011

x010011_g_shoptableindex= 49

--**********************************
--事件交互入口
--**********************************
function x010011_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  来看看吧，我这里有上好的坐骑。")
		AddNumText( sceneId, x010011_g_scriptId, "购买坐骑", 7, 100 )
		AddNumText( sceneId, x010011_g_scriptId, "骑术介绍", 11, 101 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x010011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x010011_g_shoptableindex )
	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_012}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
end
