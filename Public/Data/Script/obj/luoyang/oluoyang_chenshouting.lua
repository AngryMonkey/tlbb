--����NPC
--����ͥ
--��������

--**********************************
--�¼��������
--**********************************
function x000053_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����̻�ȱ�������Щ���������ɡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
