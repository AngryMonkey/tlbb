--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<��֦��չ�����Ķ���>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
