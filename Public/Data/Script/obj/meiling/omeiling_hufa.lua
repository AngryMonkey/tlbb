--÷��NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ˣ������ˣ�����Ҫ���������ˣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
