--����NPC
--Ϧ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x023003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ڻ�����ֻ�����˼��죬���⼸����ȴ�����ޱȰ�����ů��������ǰ����һ������ʵ���Ǻ��˲�֪���ٱ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
