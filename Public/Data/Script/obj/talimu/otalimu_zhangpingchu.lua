--塔里木NPC
--张凭初

x044504_g_ScriptId	= 044504

--**********************************
--事件交互入口
--**********************************
function x044504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_13}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

