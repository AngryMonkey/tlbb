--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x018006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����������˧���ܽ�����ҵ���������ٻ����������ٷ��ơ��������������Ǹо�ͦì�ܵġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
