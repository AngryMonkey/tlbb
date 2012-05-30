--高昌NPC
--波西密
--任务

x043502_g_ScriptId	= 043502

--**********************************
--事件交互入口
--**********************************
function x043502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_03}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
