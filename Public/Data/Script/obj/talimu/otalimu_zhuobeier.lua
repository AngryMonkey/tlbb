--����ľNPC
--׿����

x044506_g_ScriptId	= 044506

--**********************************
--�¼��������
--**********************************
function x044506_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_14}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

