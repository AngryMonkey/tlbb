--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001138_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_21}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
