--束河古镇NPC
--李铭洋
--普通

x001172_g_ScriptId	= 001172
x001172_g_MsgInfo = { "#{SHGZ_0612_01}",
											"#{SHGZ_0620_01}",
											"#{SHGZ_0620_02}",
											"#{SHGZ_0620_03}",
										}

--**********************************
--事件交互入口
--**********************************
function x001172_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )

		local msgidx = random(getn(x001172_g_MsgInfo))
		AddText( sceneId, x001172_g_MsgInfo[msgidx] )	
    AddNumText( sceneId, x001172_g_ScriptId, "前往苍山", 9, 3426 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001172_OnEventRequest( sceneId, selfId, targetId, eventId )

	--顺利传送
	local	arg	= GetNumText()

  if arg == 3426 then		--苍山
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 25, 165, 53, 20 )
		return
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x001172_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
