--���츱��NPC
--��ͨ

--**********************************
--�¼��������
--**********************************
function x155002_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"��ף��λ���ˣ�����úϣ���ù��ӣ�");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

