--ʯ��NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x026006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
