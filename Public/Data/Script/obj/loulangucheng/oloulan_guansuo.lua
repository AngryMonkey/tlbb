--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x001143_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_05}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
