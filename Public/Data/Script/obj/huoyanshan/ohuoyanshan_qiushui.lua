--����ɽNPC
--��ˮ
--����

x042503_g_ScriptId	= 042503

--**********************************
--�¼��������
--**********************************
function x042503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_18}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
