--�䵱NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<�����Ÿޣ���������>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
