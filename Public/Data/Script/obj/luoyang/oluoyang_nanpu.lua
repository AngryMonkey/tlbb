--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000037_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ү������Ϣ���κ��˲��ô��š�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
