--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x016030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������޺�ƽ�����룬û�㵨���ǲ��еġ��������Ҫ�������뵽���Ÿ�����֪�͵��Ӱ�æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
