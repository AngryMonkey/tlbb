--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001153_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_07}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
