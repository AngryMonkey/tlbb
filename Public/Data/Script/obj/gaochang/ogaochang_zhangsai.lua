--�߲�NPC
--����
--����

x043504_g_ScriptId	= 043504

--**********************************
--�¼��������
--**********************************
function x043504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_08}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
