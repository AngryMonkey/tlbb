--�߲�NPC
--���ն�
--����

x043507_g_ScriptId	= 043507

--**********************************
--�¼��������
--**********************************
function x043507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_02}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
