--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �˴���������ʥ�������¡��������Ҫ�������뵽���Ÿ�����֪��ɮ��æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
