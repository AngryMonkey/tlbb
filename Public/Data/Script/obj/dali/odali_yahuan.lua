--����NPC
--Ѿ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002047_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ǹ�Ѿ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
