--��ϪNPC
--��³��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x027002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ϲ�����������ź��ӣ�һ����˼�����Ǹ��ܲ����ϡ�#r  �����뵱��׷�ҵ����ӳ�ǧ��������ô�ῴ����ôһ���Ϲ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
