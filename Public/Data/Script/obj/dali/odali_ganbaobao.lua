--����NPC
--�ʱ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002085_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ߣ�˭�ɱ����޳�֮�£�˭�ͱ����޳ܣ��ò��������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
