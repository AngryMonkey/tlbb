--�߲�NPC
--������
--����

x043501_g_ScriptId	= 043501

--**********************************
--�¼��������
--**********************************
function x043501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_04}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
