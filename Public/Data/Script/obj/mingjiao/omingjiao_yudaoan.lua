--����NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ʥŮ����������ܲ����İ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
