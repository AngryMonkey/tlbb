--火焰山NPC
--邱水
--任务

x042503_g_ScriptId	= 042503

--**********************************
--事件交互入口
--**********************************
function x042503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_18}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
