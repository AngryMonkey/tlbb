--����NPC
--����ͬ
--һ��

--**********************************
--�¼��������
--**********************************
function x001018_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��Ҳ��Ҳ��Ӧ���ǡ�ƽ�߾����Ǵ�ɽ�����˸��ڴ�ɽ�⡣���Ŷԡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
