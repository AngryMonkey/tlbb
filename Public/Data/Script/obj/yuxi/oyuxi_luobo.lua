--��ϪNPC
--�ܲ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x027003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��á�#r  �ҵ��������ܲ���#r  �Ұ��ֵ���������ķ����#r  �Ұ���������ǹ�³����#r  �����õ������ǰ����ȡ�#r  ����#r  ������ϡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
