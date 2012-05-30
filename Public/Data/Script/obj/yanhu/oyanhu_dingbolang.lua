--盐湖NPC
--丁波浪

x041501_g_ScriptId	= 041501

--**********************************
--事件交互入口
--**********************************
function x041501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_009}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

