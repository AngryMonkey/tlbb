--ؤ��NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ؤ����ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
