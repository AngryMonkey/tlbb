--高昌NPC
--乔清风
--任务

x043505_g_ScriptId	= 043505

--**********************************
--事件交互入口
--**********************************
function x043505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_06}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
