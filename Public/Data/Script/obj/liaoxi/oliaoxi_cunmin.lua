--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x021005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������ڱ���˹�������Ҫ����Ϊ���������ɹ���̫�٣����Ҳ��Žᡣ����һ�죬һλΰ��ĺ����쵼�ɹ�������ʤ���ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
