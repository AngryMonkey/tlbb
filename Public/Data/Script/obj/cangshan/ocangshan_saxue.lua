--NPC��ѩ
--��ɽ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x025112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"ÿ�궬�죬�����ѩ�ޱ��޼ʣ�ϯ����������ڰ�ʾ��ʲô�أ��ǣ�������һ�����������Կֲ������磡")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
