--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001140_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_08}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
