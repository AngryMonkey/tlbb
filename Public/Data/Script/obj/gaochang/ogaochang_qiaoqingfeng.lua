--�߲�NPC
--�����
--����

x043505_g_ScriptId	= 043505

--**********************************
--�¼��������
--**********************************
function x043505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_06}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
