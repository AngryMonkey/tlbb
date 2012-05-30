--火焰山NPC
--牛艾尔
--任务

x042505_g_ScriptId	= 042505

--**********************************
--事件交互入口
--**********************************
function x042505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_17}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
