--盐湖NPC
--郑杨

x041506_g_ScriptId	= 041506

--**********************************
--事件交互入口
--**********************************
function x041506_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_005}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

