--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001150_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_19}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
