--苍山-束河古镇传送NPC
--孙坤
--普通

x025113_g_ScriptId	= 025113

--**********************************
--事件交互入口
--**********************************
function x025113_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		
		AddText(sceneId,"#{SHGZ_0612_38}")
    AddNumText( sceneId, x025113_g_ScriptId, "前往束河古镇", 9, 3436 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x025113_OnEventRequest( sceneId, selfId, targetId, eventId )

	--顺利传送
	local	arg	= GetNumText()

  if arg == 3436 then		--苍山
  		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x025113_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "束河古镇为不加杀气场景，请注意安全。你确认要进入吗？");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

end

--  add by zchw
function x025113_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 26, 288, 20 )
	return
end

--**********************************
--对话窗口信息提示
--**********************************
function x025113_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
