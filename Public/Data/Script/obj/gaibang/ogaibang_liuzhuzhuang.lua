--ؤ��NPC
--����ׯ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x010003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ȫ�����ڰ��ڵ�λ�����úܿ죬��ҲҪ����ѧϰ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
