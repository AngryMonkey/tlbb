--����NPC
--�粨��
--һ��

--**********************************
--�¼��������
--**********************************
function x001019_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������Ǳ��и���̨������ȥ����һ�£���ô��������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
