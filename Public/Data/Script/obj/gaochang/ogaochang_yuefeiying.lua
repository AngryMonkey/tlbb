--高昌NPC
--岳飞影
--任务

x043500_g_ScriptId	= 043500

--**********************************
--事件交互入口
--**********************************
function x043500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_07}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
