--����ɽNPC
--ţ����
--����

x042505_g_ScriptId	= 042505

--**********************************
--�¼��������
--**********************************
function x042505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_17}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
