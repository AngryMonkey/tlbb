--����NPC
--��ͨ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x011030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������صأ����������߶����������Ҫ��������ȥ���Ÿ�����֪��ʹ��æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
