--Ѿ��

--�ű���
x020005_g_scriptId = 020005

--**********************************
--�¼��б�
--**********************************
function x020005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_caoyuan_0006}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
