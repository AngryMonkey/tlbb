--高昌NPC
--艾苏尔
--任务

x043507_g_ScriptId	= 043507

--**********************************
--事件交互入口
--**********************************
function x043507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_02}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
