--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<��˵��������쳹�ƶ�>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
