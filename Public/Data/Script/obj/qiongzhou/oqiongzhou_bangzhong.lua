--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x035005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ǰ����书�����������޵У��ĳ���£�����������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
