--ʯ��NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x026008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Բ�´壬����������û�м��һ���������Բ���ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
