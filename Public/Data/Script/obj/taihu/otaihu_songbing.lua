--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x004008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ҳ��֪�����ǵ���Ҫ�ȵ�ʲô����������������飬ȥ���Ź�֧Ԯ����ɡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
