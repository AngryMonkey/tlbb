--��ɽNPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x017030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���չ�������Ů�ӣ������Ķࡣ�������Ҫ�������뵽ɽ�Ÿ�����֪�͵��Ӱ�æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
