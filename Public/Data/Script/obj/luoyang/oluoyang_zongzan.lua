--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000026_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������Ͻ���ϴ��������˹ھ�����θ�������ެ�ùھ��ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
