--����NPC
--Ľ�ݲ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ӷ�ʩ������ؾ����кι�ɣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
