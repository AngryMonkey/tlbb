--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001144_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_06}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
