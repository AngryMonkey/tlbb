--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x007007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ҽ����ֵ����أ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
