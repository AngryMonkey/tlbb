--NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x021201_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"����ѩԭ����Σ�����أ��������ɵ�С�İ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
