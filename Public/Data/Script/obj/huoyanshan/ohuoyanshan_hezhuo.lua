--����ɽNPC
--��׿
--����

x042508_g_ScriptId	= 042508

--**********************************
--�¼��������
--**********************************
function x042508_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_14}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
