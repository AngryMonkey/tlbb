--����NPC
--��Ժ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013019_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���������Ƿ�������֮�����������Ҫ�������뵽���Ÿ�����֪��ɮ��æ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
