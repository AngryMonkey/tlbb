--����NPC
--��Զɽ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"���ÿ�����ƫҪ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
