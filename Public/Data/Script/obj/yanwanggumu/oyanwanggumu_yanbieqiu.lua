--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x040001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  ������ǰΪ����������Ҳ����һ���������ѡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
