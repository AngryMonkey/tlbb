--����NPC
--Уξ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000091_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����صأ����������߶���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
