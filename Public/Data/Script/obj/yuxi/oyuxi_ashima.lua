--��ϪNPC
--��ʫ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x027005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����������𣿰��ڣ����ڸ��������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
