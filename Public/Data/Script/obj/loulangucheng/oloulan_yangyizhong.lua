--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001142_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_18}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
