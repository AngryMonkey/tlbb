--塔里木NPC
--阿尔金

x044500_g_ScriptId	= 044500

--**********************************
--事件交互入口
--**********************************
function x044500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_01}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

