--����NPC
--��ʿ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002065_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��Ҫ�д����յ�������̨��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
