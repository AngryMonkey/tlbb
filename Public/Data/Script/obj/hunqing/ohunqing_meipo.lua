--���츱��NPC
--��ͨ

--**********************************
--�¼��������
--**********************************
function x155003_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"��λӢ�ۣ���û���������ˣ�û�еĻ����Ұ������һ���ɣ�");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

