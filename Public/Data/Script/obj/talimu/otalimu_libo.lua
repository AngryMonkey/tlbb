--����ľNPC
--���

x044503_g_ScriptId	= 044503

--**********************************
--�¼��������
--**********************************
function x044503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_09}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

