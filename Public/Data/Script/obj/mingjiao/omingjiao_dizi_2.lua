--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������̵��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
