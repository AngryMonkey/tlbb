--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001162_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{DW_20080509_02}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
