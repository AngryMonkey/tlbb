--盐湖NPC
--杨元

x041504_g_ScriptId	= 041504

--**********************************
--事件交互入口
--**********************************
function x041504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_001}" )
		--AddNumText(sceneId, x041504_g_scriptId,"#{YANHU_20070924_002}", 9, 1)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x041504_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	arg	= GetNumText()
	if arg == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 26, 180,161 )
		return
	end
end
