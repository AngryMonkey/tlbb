--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x714012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
