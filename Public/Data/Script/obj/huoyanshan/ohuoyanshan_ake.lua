--火焰山NPC
--阿克
--任务

x042502_g_ScriptId	= 042502

--**********************************
--事件交互入口
--**********************************
function x042502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_01}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
