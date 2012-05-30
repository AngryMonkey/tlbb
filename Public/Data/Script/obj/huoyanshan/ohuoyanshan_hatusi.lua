--火焰山NPC
--哈图斯
--传送到敦煌

x042501_g_ScriptId	= 042501

--所拥有的事件ID列表
x042501_g_Transport = 400900
--**********************************
--事件交互入口
--**********************************
function x042501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_12}" )
		AddNumText( sceneId, x042501_g_ScriptId, "#{HYS_20071224_13}", 9, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--事件列表选中一项
--**********************************
function x042501_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction((x042501_g_Transport), "TransferFunc",sceneId, selfId, 8, 80, 116, 90, 1000)
end
