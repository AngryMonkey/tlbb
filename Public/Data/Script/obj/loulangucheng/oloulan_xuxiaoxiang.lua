--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001141_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_17}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
