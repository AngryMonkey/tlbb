--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x008006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

