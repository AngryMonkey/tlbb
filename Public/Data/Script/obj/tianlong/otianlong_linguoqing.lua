--����NPC
--�ֹ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �¹������ֹ��壬�Ƿ��ʥ��֮�����������ϻ�ү�ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
