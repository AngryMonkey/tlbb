--����NPC
--��ұ��
--һ��

--**********************************
--�¼��������
--**********************************
function x001017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����үһ��̩ɽ����ǰ���治��ɫ�����һ��Īչ��һ����������ʲô�ǳ���Ҫ�����顣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
