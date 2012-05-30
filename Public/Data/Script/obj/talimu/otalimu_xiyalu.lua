--塔里木NPC
--西亚鲁

x044505_g_ScriptId	= 044505

--**********************************
--事件交互入口
--**********************************
function x044505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_12}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

