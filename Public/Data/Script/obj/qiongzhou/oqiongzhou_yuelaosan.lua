--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x035004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������ڴ����°���һλʦ�������·�ͬС�ɡ���˵��ģ�������λʦ���ġ��R��΢�����������������ϱ��޵ڶ��˻�á�#r  ��λ����ݣ���Ҫ�������������ŵġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
