--ؤ��NPC
--ȫ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������Ĵ��һ��Ҫ����˭����˭����ɱ���������İ��ס�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
