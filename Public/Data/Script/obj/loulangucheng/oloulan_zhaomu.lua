--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001149_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_20}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
