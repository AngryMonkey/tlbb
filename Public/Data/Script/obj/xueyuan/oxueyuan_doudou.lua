--NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x021203_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"���������ҵ��𣿲�����Ԭƽ˵�Ҳ�����졭��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
