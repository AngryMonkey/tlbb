--���츱��NPC
--��ͨ

--**********************************
--�¼��������
--**********************************
function x155001_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"���������ϲ�����ˣ�����һ�������ҡ��ҿ��԰��������ֻ���");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

