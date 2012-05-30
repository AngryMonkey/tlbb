--高昌NPC
--中原商人张威
--任务

x043508_g_ScriptId	= 043508

--**********************************
--事件交互入口
--**********************************
function x043508_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_09}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
