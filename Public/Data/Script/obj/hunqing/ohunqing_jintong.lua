--���츱��NPC
--��ͨ

--**********************************
--�¼��������
--**********************************
function x155006_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"�㿴�������Ư������ϣ����һ����Ҳ�������ɡ�");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

