--����NPC
--Ե��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ե��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
