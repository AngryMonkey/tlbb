--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ˣ���ε��䷽����Ӧ��û�д��˰ɣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
