--����NPC
--���׷�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��������������ô���˻�û�����������ֵ�����������������Ķ�����թ������������ëͷС�ӿ���Ӧ���ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
