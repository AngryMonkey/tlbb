--�Ϻ�NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x034004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������С������Խ��Խ�����ˣ��ȱ��˼�����̫̫�Ķ��ӣ���ֱһ�����ϣ�һ�����¡�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
