--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000036_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ү��ɡ�����ͨ�����������Ѿ��ǳ������ˣ�������Ϊ���²��ͣ������˵��İ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
