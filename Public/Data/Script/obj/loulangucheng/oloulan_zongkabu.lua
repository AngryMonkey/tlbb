--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001151_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_22}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
