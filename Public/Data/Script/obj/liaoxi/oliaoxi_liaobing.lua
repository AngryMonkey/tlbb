--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x021006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �Ҵ��ɼ����˴������񣬶����Ź�ʩ��ѹ����������ֻʣ��������Щ������Ӧ����Щ�������ײ���β����ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
