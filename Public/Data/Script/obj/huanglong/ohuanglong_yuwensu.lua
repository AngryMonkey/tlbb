--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x023002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���������֪����ô�ˣ����Է�����˯�������춼�����﷢������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
