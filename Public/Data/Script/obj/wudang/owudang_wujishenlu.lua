--�䵱NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<�����Ÿޣ���������>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
