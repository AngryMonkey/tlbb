--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x023006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���������̫ƽ������˵ʥ�ﶼ��ç�ǻٵ��ˣ����������Ͼ�Ҫ������֮���˰ɡ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
