--����ɽNPC
--��֮��
--����

x042507_g_ScriptId	= 042507

--**********************************
--�¼��������
--**********************************
function x042507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_21}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
