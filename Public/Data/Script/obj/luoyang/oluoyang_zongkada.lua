--����NPC
--�ڿ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000041_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ǵĿ�����Զ����Щ�ǵĿ������ܡ��治��Ӧ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
