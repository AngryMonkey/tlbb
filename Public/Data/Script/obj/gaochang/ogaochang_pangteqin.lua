--高昌NPC
--庞特沁
--任务

x043503_g_ScriptId	= 043503

--**********************************
--事件交互入口
--**********************************
function x043503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_05}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
