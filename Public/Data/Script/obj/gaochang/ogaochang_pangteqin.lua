--�߲�NPC
--������
--����

x043503_g_ScriptId	= 043503

--**********************************
--�¼��������
--**********************************
function x043503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_05}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
