--火焰山NPC
--宋之问
--任务

x042507_g_ScriptId	= 042507

--**********************************
--事件交互入口
--**********************************
function x042507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_21}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
