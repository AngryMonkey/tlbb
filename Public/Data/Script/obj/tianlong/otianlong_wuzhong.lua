--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �¹��������ң��Ƿ��ʥ��֮�����������ϻ�ү�ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
