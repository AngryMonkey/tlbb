--����NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002086_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ҷ�����úá����������ͽ�Գѷ���������ԩ������ͷ���Լ���������Ů�����ɼ飬�����Ǳ����޳�֮���ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
