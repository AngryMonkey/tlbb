--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x004004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �о�������Ȼս��ս�Եȸ����涼����Ҫ����������Ϊ�����ĸ�Ϊ��Ҫ���������ߵ����°���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
