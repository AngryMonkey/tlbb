--��ɽNPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x017033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ɽ�ɵ��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
