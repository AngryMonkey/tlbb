--����NPC
--ʿ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�������صأ���Ҫ���ܣ�С����·��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
