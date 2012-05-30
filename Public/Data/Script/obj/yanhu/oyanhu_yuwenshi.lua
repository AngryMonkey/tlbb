--盐湖NPC
--宇文氏

x041505_g_ScriptId	= 041505

--**********************************
--事件交互入口
--**********************************
function x041505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_004}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

