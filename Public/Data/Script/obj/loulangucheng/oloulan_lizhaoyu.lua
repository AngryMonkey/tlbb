--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001148_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_11}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
