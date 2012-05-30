--高昌NPC
--艾莫尔
--任务

x043506_g_ScriptId	= 043506

--**********************************
--事件交互入口
--**********************************
function x043506_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_01}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
