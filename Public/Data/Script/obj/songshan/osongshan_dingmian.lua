--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x003005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �Դӷ����Ǽ���������Ǽҹ��ӵľ���һֱ��̫�ã��������׿���ʲô��ѽ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
