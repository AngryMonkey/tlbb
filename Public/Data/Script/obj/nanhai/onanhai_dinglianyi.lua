--�Ϻ�NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x034002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ʦ����ʦ������д�ʦ�֡����������������������Ѿ������������ء����������ң��Ҳ�Ҫ���ˡ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
