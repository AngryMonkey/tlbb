--����NPC
--ʿ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x030006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �Ž����ñ�����ˮ�����������Խ��Խ��С�ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
