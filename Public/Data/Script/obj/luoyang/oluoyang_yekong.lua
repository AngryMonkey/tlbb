--����NPC
--ҵ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000095_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ʩ�������������ˡ���ʦ�����ڵ����ء�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
