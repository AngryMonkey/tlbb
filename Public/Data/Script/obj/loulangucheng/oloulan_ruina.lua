--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001137_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_15}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
