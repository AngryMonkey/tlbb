--����NPC
--Ѿ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x005002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����үû����ʱ��С�����춼�ڿޣ���ôȰ��Ȱ��ס���ɶ���ү���˵�ʱ��С��һ���Ӿ͸��������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
