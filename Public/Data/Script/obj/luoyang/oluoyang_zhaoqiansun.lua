--����NPC
--��Ǯ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000025_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��Ҳ���������°ݷ��������ķ�������ˣ�С��ǰЩ���Ӹ��������ˣ�һ�����ҵĳ��ĸж��˷��桭��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
