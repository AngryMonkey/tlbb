--¥��NPC....
--����....

--�ű���
x001155_g_scriptId = 001155


--**********************************
--�¼��������
--**********************************
function x001155_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_15}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
