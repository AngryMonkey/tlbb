--�置NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x029005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����Һ����µ����ĺ���ƣ��о�����̫����ˡ��Ŵ�ʦ�ĵ��Ƽ������ǽ��˲��ò�̾Ϊ��ֹ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
