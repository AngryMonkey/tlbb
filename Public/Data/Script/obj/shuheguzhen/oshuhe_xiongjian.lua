--束河古镇NPC....
--武器相关功能....

--脚本号
x001178_g_ScriptId = 001178
x001178_g_MsgInfo = { "#{SHGZ_0612_04}",
											"#{SHGZ_0620_10}",
											"#{SHGZ_0620_11}",
											"#{SHGZ_0620_12}",
										}

--**********************************
--事件交互入口
--**********************************
function x001178_OnDefaultEvent( sceneId, selfId, targetId )

	
	BeginEvent( sceneId )
		local msgidx = random(getn(x001178_g_MsgInfo))
		AddText( sceneId, x001178_g_MsgInfo[msgidx] )
		AddNumText( sceneId, x001178_g_ScriptId, "装备资质鉴定", 6, 1 )
		AddNumText( sceneId, x001178_g_ScriptId, "装备资质鉴定介绍", 11, 3 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x001178_OnEventRequest( sceneId, selfId, targetId, eventId )

	
	if GetNumText() == 1 then

		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )

	elseif GetNumText() == 3 then
	
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_081}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return

	end

end
