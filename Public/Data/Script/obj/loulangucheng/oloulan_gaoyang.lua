--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_04}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
