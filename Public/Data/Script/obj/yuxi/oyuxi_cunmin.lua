--��ϪNPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x027007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��³�������Ǹ���ҽ��������������ҩ��ʲô�ֲ����ܺá�����Ȼ������Щ��ֵĸ����á���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
