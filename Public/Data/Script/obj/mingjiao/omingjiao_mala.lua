--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ٻ�����˵��������������������кöഫ˵��������ȥ������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
