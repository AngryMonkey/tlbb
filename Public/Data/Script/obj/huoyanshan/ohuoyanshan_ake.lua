--����ɽNPC
--����
--����

x042502_g_ScriptId	= 042502

--**********************************
--�¼��������
--**********************************
function x042502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_01}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
