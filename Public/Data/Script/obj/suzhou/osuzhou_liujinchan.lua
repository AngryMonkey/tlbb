--����NPC
--�����
--һ��

--**********************************
--�¼��������
--**********************************
function x001038_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �и������ݿ��ԵĿ������ղ�ɢ��������档")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
