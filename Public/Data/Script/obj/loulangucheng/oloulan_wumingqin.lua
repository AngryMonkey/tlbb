--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001152_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_16}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
