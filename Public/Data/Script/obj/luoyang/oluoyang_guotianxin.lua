--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������ˮ�ǜR�յ�����������֣��п�ȥ�����ɡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
