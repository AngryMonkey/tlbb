--����NPC
--�ҳ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x004005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ô������ô��ٱ����Ҷ����ҳ�ȥ�������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
