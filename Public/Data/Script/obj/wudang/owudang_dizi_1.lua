--�䵱NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Բת���⣬�徲��Ϊ����������䵱ɽ���������Ҫ�������뵽ɽ�Ÿ�����֪�͵��˰�æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
