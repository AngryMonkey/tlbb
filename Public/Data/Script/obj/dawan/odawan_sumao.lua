--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001161_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{DW_20080509_03}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
