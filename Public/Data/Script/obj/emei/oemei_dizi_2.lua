--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015031_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���Ƕ����ɵ��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
