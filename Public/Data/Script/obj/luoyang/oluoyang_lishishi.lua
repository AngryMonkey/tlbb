--����NPC
--��ʦʦ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000027_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �޿��κλ���ȥ��������ʶ�������С԰�㾶���ǻ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
