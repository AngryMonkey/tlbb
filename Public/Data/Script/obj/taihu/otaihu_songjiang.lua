--����NPC
--�ν�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x004007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����һ�����̶����Ǻ��ӽ������ԣ�����С��˼�ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
