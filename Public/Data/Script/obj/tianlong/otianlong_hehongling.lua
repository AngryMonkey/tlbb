--����NPC
--�κ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013012_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ʦ�����������������һ���󱲣������ǵ�����ϵ�ֶ�������ж�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
