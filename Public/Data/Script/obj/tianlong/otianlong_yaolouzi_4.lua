--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013018_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
