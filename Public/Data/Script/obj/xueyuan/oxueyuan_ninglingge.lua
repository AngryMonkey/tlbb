--NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x021200_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"����˵��������ߵ��Ҹ������˵��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
