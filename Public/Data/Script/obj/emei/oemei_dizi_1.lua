--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ӭ����������ɽ���������Ҫ�������뵽ɽ�Ÿ�����֪��ʹ��æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
