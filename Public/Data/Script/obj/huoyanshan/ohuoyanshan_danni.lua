--����ɽNPC
--����
--����

x042509_g_ScriptId	= 042509

--**********************************
--�¼��������
--**********************************
function x042509_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_11}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
