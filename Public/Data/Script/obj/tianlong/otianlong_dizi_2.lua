--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���Ǵ����ɵ��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
