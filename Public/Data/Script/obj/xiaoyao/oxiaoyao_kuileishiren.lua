--NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ң������F-16���Ѿ���һ�����ص�ϵͳ�����лָ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
