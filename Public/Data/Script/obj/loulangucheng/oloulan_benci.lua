--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001146_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_03}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
