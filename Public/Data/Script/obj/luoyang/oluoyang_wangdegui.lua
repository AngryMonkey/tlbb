--洛阳NPC
--王德贵
--普通

--脚本号
x000050_g_ScriptId			= 000050

--武器店
x000050_g_shoptableindex= 11

--**********************************
--事件交互入口
--**********************************
function x000050_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddText( sceneId, "  来看看吧，我这里的兵器都是洛阳城最好的。" )
	AddNumText( sceneId, x000050_g_ScriptId, "购买兵器", 7, 100 )
	AddNumText( sceneId, x000050_g_ScriptId, "资质鉴定", 6, 101 )
	AddNumText( sceneId, x000050_g_ScriptId, "重新鉴定装备资质", 6, 102 )
	AddNumText( sceneId, x000050_g_ScriptId, "装备资质鉴定介绍", 11, 105 )
	AddNumText( sceneId, x000050_g_ScriptId, "重新鉴定装备资质介绍", 11, 106 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000050_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 105 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_081}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 106 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_097}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	key	= GetNumText()
	if key == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x000050_g_shoptableindex )
	elseif key == 101 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )
	elseif key == 102 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112233 )
	end
end
