--����NPC
--�ڿ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000042_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��֪���������ϴ�ᣬ�ķ���Ӯ�������ڴ�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
