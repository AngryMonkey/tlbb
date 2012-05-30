--塔里木NPC
--罗莎

x044501_g_ScriptId	= 044501

--**********************************
--事件交互入口
--**********************************
function x044501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_10}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

