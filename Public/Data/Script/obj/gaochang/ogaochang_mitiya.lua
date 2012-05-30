--高昌NPC
--米提亚
--任务

x043501_g_ScriptId	= 043501

--**********************************
--事件交互入口
--**********************************
function x043501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_04}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
