--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���������Ƿ�������֮�����������Ҫ�������뵽���Ÿ�����֪��ɮ��æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
