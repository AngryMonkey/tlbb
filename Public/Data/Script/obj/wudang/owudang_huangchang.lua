--�䵱NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�䵱ɽ������̷�չ��¡�����г�������ɽ����Ϊ�л���һ������ɽ֮�ơ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
