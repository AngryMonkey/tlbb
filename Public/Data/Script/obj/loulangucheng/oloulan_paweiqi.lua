--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001136_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_13}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
