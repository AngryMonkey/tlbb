--����ɽNPC
--����
--����

x042504_g_ScriptId	= 042504

--**********************************
--�¼��������
--**********************************
function x042504_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_16}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
