--��ңNPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  С�ģ��R�����д����ǻ��أ��ɲ�Ҫ�ߵ�����֮�С��������Ҫ�������뵽���Ÿ�����֪�͵��Ӱ�æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
