--���츱��NPC
--��ͨ

--**********************************
--�¼��������
--**********************************
function x155004_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"�㿴�����ɣ���˧������ϣ����һ����Ҳ�������");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

