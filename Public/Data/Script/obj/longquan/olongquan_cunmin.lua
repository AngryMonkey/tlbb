--��ȪNPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x031010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������Ĳ�Ҷ�����ϻ��ܴ��Ȫˮ�������������µ������衣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
