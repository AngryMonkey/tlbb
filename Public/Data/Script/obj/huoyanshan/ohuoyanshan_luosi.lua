--����ɽNPC
--��˹
--����

x042506_g_ScriptId	= 042506

--**********************************
--�¼��������
--**********************************
function x042506_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_15}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
