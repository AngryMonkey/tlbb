--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ӷ��г��޳���˫�����٣��ϱ��������Ǽٷǿգ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
