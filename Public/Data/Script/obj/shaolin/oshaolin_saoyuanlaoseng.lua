--����NPC
--ɨԺ��ɮ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x009008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ʩ���ڽ����ϵĴ������������ж��š�����һ������Ȼ�������鴫��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
