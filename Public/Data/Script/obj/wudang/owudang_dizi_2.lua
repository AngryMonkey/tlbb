--�䵱NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����䵱�ɵ��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
