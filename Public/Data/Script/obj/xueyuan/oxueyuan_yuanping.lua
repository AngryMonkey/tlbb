--NPC
--Ԭƽ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x021202_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"����������ڱ�����ľ���������֪��������ô���ġ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
