--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001135_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_01}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
