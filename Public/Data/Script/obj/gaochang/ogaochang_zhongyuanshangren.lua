--�߲�NPC
--��ԭ��������
--����

x043508_g_ScriptId	= 043508

--**********************************
--�¼��������
--**********************************
function x043508_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  #{GC_20080125_09}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
