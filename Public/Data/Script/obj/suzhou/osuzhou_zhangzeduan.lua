--����NPC
--�����
--һ��

--**********************************
--�¼��������
--**********************************
function x001011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ٹ����վ����������ˣ���ʱ��������ͷ�϶��������ޱȡ����ܰ������ݵ��������ڵ���֮�У��Ǹö�ð���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
