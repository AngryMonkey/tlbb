--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001163_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{DW_20080509_01}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
