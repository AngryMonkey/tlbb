--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002022_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������������ҵ�ְ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
