--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ո������ʦ����һ���µ����ģ�Ҳ��֪����������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
