--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x008008_OnDefaultEvent( sceneId, selfId,targetId )
  BeginEvent(sceneId)
	  AddText(sceneId,"  �����Ѿ�����˻����͹��ȣ��������Źأ���ռ�γ�����������顣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

