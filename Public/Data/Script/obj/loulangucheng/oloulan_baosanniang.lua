--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001145_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_02}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
