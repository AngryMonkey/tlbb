--�߲�NPC
--����Ӱ
--����

x043500_g_ScriptId	= 043500

--**********************************
--�¼��������
--**********************************
function x043500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_07}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
