--÷��NPC
--����˹�ٰ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �װ������ѣ���������Ұ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�����¼�
--**********************************
function x033011_OnDie( sceneId, selfId, killerId )
end
