--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���������ɵ��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
