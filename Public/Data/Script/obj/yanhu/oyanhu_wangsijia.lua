--盐湖NPC
--王思佳

x041503_g_ScriptId	= 041503

--**********************************
--事件交互入口
--**********************************
function x041503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_003}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

