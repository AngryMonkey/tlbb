--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001160_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{DW_20080509_04}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
