--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x030005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ܴ����ڿɲ�ƽ������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
