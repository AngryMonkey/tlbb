--����ľNPC
--������

x044500_g_ScriptId	= 044500

--**********************************
--�¼��������
--**********************************
function x044500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_01}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

