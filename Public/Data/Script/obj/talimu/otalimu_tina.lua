--����ľNPC
--���

x044502_g_ScriptId	= 044502

--**********************************
--�¼��������
--**********************************
function x044502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_11}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

