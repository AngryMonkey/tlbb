--��ңNPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������ң�ɵ��ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
