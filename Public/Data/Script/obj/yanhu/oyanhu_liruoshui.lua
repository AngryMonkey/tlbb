--盐湖NPC
--李若水

x041502_g_ScriptId	= 041502

--**********************************
--事件交互入口
--**********************************
function x041502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_010}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

