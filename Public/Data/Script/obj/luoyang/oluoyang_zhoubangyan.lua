--����NPC
--�ܰ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������˵ʦʦС�㱻�ͽ��˶��������治������������ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
