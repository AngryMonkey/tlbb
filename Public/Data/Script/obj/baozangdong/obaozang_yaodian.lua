--���ض�һ�����NPC
--Ҧ��Ҧ����Ҧ����Ҧ�١�Ҧ��
--ҩ��

--**********************************
--�¼��������
--**********************************
function x039001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ض��ﱦ������������Ҳ������֣�������һ��Ҫ׼����ȫ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
