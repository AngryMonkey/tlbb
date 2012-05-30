--火焰山NPC
--丹妮
--任务

x042509_g_ScriptId	= 042509

--**********************************
--事件交互入口
--**********************************
function x042509_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_11}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
