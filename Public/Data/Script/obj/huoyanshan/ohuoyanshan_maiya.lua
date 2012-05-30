--火焰山NPC
--麦雅
--任务

x042504_g_ScriptId	= 042504

--**********************************
--事件交互入口
--**********************************
function x042504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_16}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
