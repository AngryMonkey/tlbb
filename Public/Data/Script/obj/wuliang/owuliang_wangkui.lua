--����

--�ű���
x006010_g_scriptId = 0060010


--**********************************
--�¼��������
--**********************************
function x006010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_wuliang_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


