--����NPC
--ɣ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x013013_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������ϻ�ү���������������������ˣ����һ�һֱ�ǵ�����ǰ����������������Ǹ������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
