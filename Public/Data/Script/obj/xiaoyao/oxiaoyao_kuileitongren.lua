--NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x014011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ң������F-17173��Ŀǰ���������������á������㡭���ܳ�������������ŶҮ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
