--���츱��NPC
--��ͨ

--**********************************
--�¼��������
--**********************************
function x155007_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"��ף��λ���ˣ��ɲ�Ůò����ͷ���ϣ�");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

