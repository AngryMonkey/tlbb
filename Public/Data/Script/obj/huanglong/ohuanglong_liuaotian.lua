--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x023005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ã���ԭ��Ӣ�ۣ��ҽ������졣������ū�˵ĺ��ᣬ��������ģ���Ҳ���Խ���������졣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
