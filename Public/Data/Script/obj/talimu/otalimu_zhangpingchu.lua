--����ľNPC
--��ƾ��

x044504_g_ScriptId	= 044504

--**********************************
--�¼��������
--**********************************
function x044504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{TLM_20080118_13}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

