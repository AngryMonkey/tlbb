--�߲�NPC
--������
--����

x043502_g_ScriptId	= 043502

--**********************************
--�¼��������
--**********************************
function x043502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_03}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
