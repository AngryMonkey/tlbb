--����NPC
--�Ƴ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Сɮ�����Ƴգ��ڴ�����黨�³��ң����������¹ҵ��ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
