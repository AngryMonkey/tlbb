--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000039_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �þ�δ����ʦ����Ϊ�����#r  ��ʦ�����ǽ̻��з���ʹ����������ܶ�����ĵ�����������������ʦ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
